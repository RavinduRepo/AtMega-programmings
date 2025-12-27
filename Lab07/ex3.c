#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

// === LCD Pins connected to PORTB ===
// RS = PB0, E = PB1, Data Pins D4-D7 = PB2-PB5
#define LCD_RS PB0
#define LCD_E PB1
#define LCD_D4 PB2
#define LCD_D5 PB3
#define LCD_D6 PB4
#define LCD_D7 PB5

// === Keypad configuration ===
// Rows connected to PC0-PC3 (inputs with pull-ups)
// Columns connected to PD4-PD7 (outputs)

const char KEYPAD[4][4] = {
    {'1', '2', '3', 'A'},
    {'4', '5', '6', 'B'},
    {'7', '8', '9', 'C'},
    {'*', '0', '#', 'D'}};

// EEPROM address where Caesar cipher key is stored
#define KEY_ADDR 0

// Helper macros to set and clear bits in registers
#define SET_BIT(port, bit) ((port) |= (1 << (bit)))
#define CLEAR_BIT(port, bit) ((port) &= ~(1 << (bit)))

// -------- LCD FUNCTIONS --------

// Enable pulse for LCD (E pin toggle)
void lcd_enable()
{
    SET_BIT(PORTB, LCD_E);
    _delay_us(1);
    CLEAR_BIT(PORTB, LCD_E);
    _delay_us(100);
}

// Send 4-bit nibble to LCD data pins (D4-D7)
void lcd_send_nibble(uint8_t nibble)
{
    if (nibble & 0x01)
        SET_BIT(PORTB, LCD_D4);
    else
        CLEAR_BIT(PORTB, LCD_D4);

    if (nibble & 0x02)
        SET_BIT(PORTB, LCD_D5);
    else
        CLEAR_BIT(PORTB, LCD_D5);

    if (nibble & 0x04)
        SET_BIT(PORTB, LCD_D6);
    else
        CLEAR_BIT(PORTB, LCD_D6);

    if (nibble & 0x08)
        SET_BIT(PORTB, LCD_D7);
    else
        CLEAR_BIT(PORTB, LCD_D7);

    lcd_enable();
}

// Send byte to LCD: is_data=1 for data, 0 for command
void lcd_send_byte(uint8_t byte, uint8_t is_data)
{
    if (is_data)
        SET_BIT(PORTB, LCD_RS);
    else
        CLEAR_BIT(PORTB, LCD_RS);

    // Send high nibble first
    lcd_send_nibble(byte >> 4);
    // Then low nibble
    lcd_send_nibble(byte & 0x0F);
    _delay_ms(2);
}

// Send command byte to LCD
void lcd_cmd(uint8_t cmd)
{
    lcd_send_byte(cmd, 0);
}

// Write a single character to LCD
void lcd_char(char c)
{
    lcd_send_byte(c, 1);
}

// Write null-terminated string to LCD
void lcd_print(const char *str)
{
    while (*str)
        lcd_char(*str++);
}

// Initialize LCD in 4-bit mode, 2 lines, no cursor
void lcd_init()
{
    DDRB |= 0x3F; // Set PB0-PB5 as outputs for LCD

    _delay_ms(50); // Wait for LCD to power up

    // Initialization sequence per datasheet
    lcd_send_nibble(0x03);
    _delay_ms(5);
    lcd_send_nibble(0x03);
    _delay_ms(5);
    lcd_send_nibble(0x03);
    _delay_ms(1);
    lcd_send_nibble(0x02); // 4-bit mode

    lcd_cmd(0x28); // Function set: 4-bit, 2-line, 5x8 dots
    lcd_cmd(0x0C); // Display ON, cursor OFF, blink OFF
    lcd_cmd(0x06); // Entry mode: increment cursor, no shift
    lcd_cmd(0x01); // Clear display
    _delay_ms(2);
}

// Position cursor at col (0-based), row (0 or 1)
void lcd_set_cursor(uint8_t col, uint8_t row)
{
    lcd_cmd(0x80 + (row * 0x40) + col);
}

// -------- EEPROM FUNCTIONS --------

// Write a byte to EEPROM address (blocking)
void EEPROMwrite(uint16_t address, uint8_t data)
{
    while (EECR & (1 << EEPE))
        ;                 // Wait if write in progress
    cli();                // Disable interrupts
    EEAR = address;       // Set address register
    EEDR = data;          // Set data register
    EECR |= (1 << EEMPE); // Enable master write
    EECR |= (1 << EEPE);  // Start write
    sei();                // Enable interrupts
}

// Read a byte from EEPROM address
uint8_t EEPROMread(uint16_t address)
{
    while (EECR & (1 << EEPE))
        ;                // Wait if write in progress
    EEAR = address;      // Set address
    EECR |= (1 << EERE); // Start read
    return EEDR;         // Return data
}

// -------- CAESAR CIPHER FUNCTION --------

// Encrypt single character with Caesar cipher key
char caesar(char c, uint8_t key)
{
    if (c >= 'A' && c <= 'Z')
        return ((c - 'A' + key) % 26) + 'A';
    if (c >= 'a' && c <= 'z')
        return ((c - 'a' + key) % 26) + 'a';
    return c; // Non-alphabetic characters unchanged
}

// -------- KEYPAD FUNCTIONS --------

// Initialize keypad pins (rows as inputs with pull-ups, cols as outputs)
void keypad_init()
{
    DDRC &= ~(0x0F); // PC0-PC3 input (rows)
    PORTC |= 0x0F;   // Enable pull-ups on rows

    DDRD |= 0xF0;  // PD4-PD7 output (cols)
    PORTD |= 0xF0; // Set cols HIGH initially
}

// Scan keypad and return pressed key or 0 if none
char keypad_get_key()
{
    uint8_t col;
    for (col = 0; col < 4; col++)
    {
        PORTD = ~(1 << (col + 4)); // Pull one column LOW at a time
        _delay_us(5);              // Short delay to settle signals

        uint8_t row;
        for (row = 0; row < 4; row++)
        {
            if (!(PINC & (1 << row))) // Check if row is LOW (pressed)
            {
                // Wait for key release (debounce)
                while (!(PINC & (1 << row)))
                    ;
                _delay_ms(50); // Debounce delay
                return KEYPAD[row][col];
            }
        }
    }
    return 0; // No key pressed
}

// -------- USER INPUT FUNCTIONS --------

// Get exactly 'len' characters input from keypad, echo to LCD
void get_text(char *buffer, uint8_t len)
{
    uint8_t i = 0;
    while (i < len)
    {
        char key = keypad_get_key();
        if (key)
        {
            buffer[i++] = key;
            lcd_char(key);
        }
    }
    buffer[len] = '\0'; // Null terminate string
}

// Input a decimal number (0-25) via keypad, '#' to finish
uint8_t input_key()
{
    uint8_t val = 0;
    while (1)
    {
        char key = keypad_get_key();
        if (key >= '0' && key <= '9')
        {
            val = val * 10 + (key - '0');
            lcd_char(key);
        }
        else if (key == '*')
        {
            return val;
        }
    }
}

// -------- MAIN PROGRAM --------

int main(void)
{
    lcd_init();    // Initialize LCD hardware
    keypad_init(); // Initialize keypad hardware

    // Read stored key from EEPROM, default to 3 if invalid
    uint8_t key = EEPROMread(KEY_ADDR);
    if (key > 25)
    {
        key = 3;
        EEPROMwrite(KEY_ADDR, key);
    }

    while (1)
    {
        lcd_cmd(0x01); // Clear LCD
        lcd_print("1:Encrypt 2:Key");
        _delay_ms(1000);

        char choice = 0;
        while (!choice)
            choice = keypad_get_key();

        if (choice == '1') // Encryption mode
        {
            lcd_cmd(0x01);
            lcd_print("Enter text (10):");
            lcd_set_cursor(0, 1);

            char input[11], output[11];
            get_text(input, 10); // Get 10 chars

            uint8_t i;
            for (i = 0; i < 10; i++)
                output[i] = caesar(input[i], key);
            output[10] = '\0';

            lcd_cmd(0x01);
            lcd_print("Encrypted:");
            lcd_set_cursor(0, 1);
            lcd_print(output);

            _delay_ms(80000); // Display result
        }
        else if (choice == '2') // Change key mode
        {
            lcd_cmd(0x01);
            lcd_print("Enter key 0-25:");
            lcd_set_cursor(0, 1);

            uint8_t newKey = input_key();

            if (newKey <= 25)
            {
                EEPROMwrite(KEY_ADDR, newKey);
                key = newKey;

                lcd_cmd(0x01);
                lcd_print("Key Saved!");
            }
            else
            {
                lcd_cmd(0x01);
                lcd_print("Invalid Key");
            }
            _delay_ms(3000);
        }
    }
}
