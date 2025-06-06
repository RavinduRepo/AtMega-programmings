#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

volatile uint8_t binary_input = 0;
volatile uint8_t bit_count = 0;

int main(void) {
    DDRB |= 0x3F; // PB0 to PB5 as output
    DDRD &= ~((1 << PD2) | (1 << PD3)); // Set PD2 (INT0) and PD3 (INT1) as input
    PORTD |= (1 << PD2) | (1 << PD3);   // Enable internal pull-up resistors

    // Configure INT0 to trigger on falling edge
    EICRA |= (1 << ISC01);
    EICRA &= ~(1 << ISC00);

    // Configure INT1 to trigger on falling edge
    EICRA |= (1 << ISC11);
    EICRA &= ~(1 << ISC10);

    EIMSK |= (1 << INT0) | (1 << INT1); // Enable INT0 and INT1

    sei(); // Enable global interrupts

    while (1) {
        // Main loop does nothing, waiting for interrupts
    }
}

ISR(INT0_vect) { // Button A pressed
    _delay_ms(50); // Debounce
    if (!(PIND & (1 << PD2))) { // Confirm button still pressed
        if (bit_count < 6) {
            binary_input <<= 1; // Add 0 bit
            bit_count++;
            PORTB = (PORTB & 0xC0) | (binary_input & 0x3F);
        }
    }
}

ISR(INT1_vect) { // Button B pressed
    _delay_ms(50); // Debounce
    if (!(PIND & (1 << PD3))) { // Confirm button still pressed
        if (bit_count < 6) {
            binary_input = (binary_input << 1) | 1; // Add 1 bit
            bit_count++;
            PORTB = (PORTB & 0xC0) | (binary_input & 0x3F);
        }
    }
}
