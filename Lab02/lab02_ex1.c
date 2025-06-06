#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    DDRD &= ~(1 << PD7);     // PD7 as input
    PORTD |= (1 << PD7);     // Enable pull-up
    DDRB |= 0x3F;            // PORTB lower 6 bits as output

    uint8_t count = 0;
    uint8_t prevState = 1;

    while (1) {
        uint8_t currentState = PIND & (1 << PD7);

        if (!currentState && prevState) {
            _delay_ms(50);   // Debounce
            if (!(PIND & (1 << PD7))) {
                count++;
                PORTB = (PORTB & 0xC0) | (count & 0x3F);
            }
        }

        prevState = currentState;
    }
}



