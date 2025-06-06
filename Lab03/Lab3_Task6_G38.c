#include <avr/io.h>
#include <avr/interrupt.h>

volatile uint16_t count0 = 0;
volatile uint16_t count1 = 0;

ISR(TIMER0_OVF_vect) {
    count0++;
    if (count0 >= 25) {
        PORTB ^= (1 << PB5); // 50ms toggle
        count0 = 0;
    }
}

ISR(TIMER1_OVF_vect) {
    PORTB ^= (1 << PB0); // 500ms toggle

}

void setup_timer0() {
    TCCR0A = 0;
    TCCR0B = (1 << CS02);   // Prescaler = 256, Overflow = 1.024ms
    TIMSK0 = (1 << TOIE0);
    TCNT0 = 131;
}

void setup_timer1() {
    TCCR1A = 0;
    TCCR1B = (1 << CS12);  // Prescaler = 1024
    TIMSK1 = (1 << TOIE1);
    TCNT1 = 34286;  // 1s/30 = 33.3ms overflow
}

int main(void) {
    DDRB |= (1 << PB5) | (1 << PB0);
    setup_timer0();
    setup_timer1();
    sei();

    while (1);
}
