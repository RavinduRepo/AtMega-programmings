#include <avr/io.h>
#include <util/delay.h>

#define BLINK_DELAY_MS 500  // 500ms delay

int main(void) {
    // Set PB0–PB3 as outputs
    DDRB |= 0x0F;  // 00001111 in binary — sets lower 4 bits (PB0 to PB3) as outputs

    while (1) {
        PORTB |= 0x0F;       // Turn all 4 LEDs ON
        _delay_ms(BLINK_DELAY_MS);
        PORTB &= ~0x0F;      // Turn all 4 LEDs OFF
        _delay_ms(BLINK_DELAY_MS);
    }
}

