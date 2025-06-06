#include <avr/io.h>
#include <util/delay.h>

#define KNIGHT_DELAY_MS 200

int main(void) {
    // Set PB0–PB3 as outputs
    DDRB |= 0x0F;

    // Create an array representing the LED pattern
    uint8_t pattern[] = {0x01, 0x02, 0x04, 0x08, 0x04, 0x02}; 
    // 0x01 = PB0, 0x02 = PB1, etc.

    while (1) {
        for (int i = 0; i < 6; i++) {
            PORTB = (PORTB & ~0x0F) | pattern[i]; // Clear PB0–PB3 and set new value
            _delay_ms(KNIGHT_DELAY_MS);
        }
    }
}

