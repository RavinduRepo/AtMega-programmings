#include <avr/io.h>
#include <avr/interrupt.h>

volatile uint8_t count = 0;

ISR(TIMER0_OVF_vect) {
    count++;
    if (count >= 25) {  // 61 × 1.024ms ≈ 62.5ms
        PORTB ^= (1 << PB5);
        count = 0;
    }
}

void setup_timer0() {
    TCCR0A = 0;
    TCCR0B = (1 << CS02);   // Prescaler = 256 → 1.024 ms per overflow
    TIMSK0 = (1 << TOIE0);  // Enable overflow interrupt
    TCNT0 = 6;
}

int main(void) {
    DDRB |= (1 << PB5);
    setup_timer0();
    sei();

    while (1);
}

