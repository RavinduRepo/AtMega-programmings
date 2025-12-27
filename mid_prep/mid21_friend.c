#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

volatile uint8_t overflow_count = 0;
const uint8_t sequence[] = {PB1, PB2, PB3, PB4, PB5, PB4, PB3, PB2};
volatile uint8_t led_count = 0;
volatile uint8_t running = 1;

void initTimer2PWM() {
    OCR2A = 0;
    TCCR2A = (1 << WGM20) | (1 << WGM21) | (1 << COM2A1); // Fast PWM, non-inverted
    TCCR2B = (1 << CS21) | (1 << CS20); // Prescaler 64
}

void stopTimer2PWM() {
    TCCR2A = (0<<COM2A1) | (1<<WGM21) | (1<<WGM20);
    TCCR2B = (1<< CS21) | (1<< CS20);
    OCR2A=0;
}

ISR(TIMER0_OVF_vect) {
    if (running) {
        overflow_count++;
        if (overflow_count >= 50) {
            stopTimer2PWM(); // Optional: turn off after fade

            overflow_count = 0;
            TCNT0 = 6;

            PORTB &= ~((1 << PB1) | (1 << PB2) | (1 << PB3) | (1 << PB4) | (1 << PB5));
            PORTB |= (1 << sequence[led_count]);

            led_count++;
            if (led_count > 7) {
                led_count = 0;
            }
        }
    }
}

ISR(INT1_vect) {
    _delay_ms(50); // debounce
    running ^= 1;  // toggle state push button
}

int main() {
    DDRB |= (1 << PB1) | (1 << PB2) | (1 << PB3) | (1 << PB4) | (1 << PB5); // LED output
    DDRD &= ~(1 << PD3); // Button input
    PORTD |= (1 << PD3); // Pull-up resistor

    TCCR0A = 0x00; // Timer0 normal mode
    TCCR0B = (1 << CS02); // Prescaler 256
    TIMSK0 |= (1 << TOIE0);
    TCNT0 = 6;

    EICRA |= (1 << ISC11);  // Falling edge INT1
    EICRA &= ~(1 << ISC10);
    EIMSK |= (1 << INT1);

    sei(); // Global interrupt enable

    while (1) {
        if (running == 0 && (PORTB & (1 << PB3))) {
            initTimer2PWM();
            for (int i = 255; i >= 0; i--) {
                OCR2A = i;
                _delay_ms(5);
            }

            for (int i = 0; i < 256; i++) {
                OCR2A = i;
                _delay_ms(5);
            }
            
        }
    }
}