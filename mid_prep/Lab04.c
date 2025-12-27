#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

int main(void)
{
    // Initialize ports
    DDRB |= (1 << PB3);

    // Fast pwm
    TCCR2A |= (1 << WGM21) | (1 << WGM20);
    TCCR2B &= ~(1 << WGM22);

    // Non- inverting
    TCCR2A |= (1 << COM2A1);
    TCCR2A &= ~(1 << COM2A0);

    // Fixing duty cycle
    // OCR2A = 0;

    // Prescaler
    TCCR2B |= (1 << CS21) | (1 << CS20); // Pre scaler 64

    // Main loop
    while (1)
    {
        // OCR2A = 0;
        for (int i = 0; i < 256; i++)
        {
            OCR2A = i;
            _delay_ms(10);
        }
        for (int i = 254; i > 0; i--)
        {
            OCR2A = i;
            _delay_ms(10);
        }
    }

    return 0;
}
