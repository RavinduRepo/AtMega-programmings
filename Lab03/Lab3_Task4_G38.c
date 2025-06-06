#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

volatile uint8_t toggle = 0;

ISR(TIMER1_OVF_vect) {
    toggle ^= 1;
    if (toggle)
        PORTB |= (1 << PB5);
    else
        PORTB &= ~(1 << PB5);
}

void setup_timer1() {
    TCCR1A = 0;
    TCCR1B = (1 << CS12); // Prescaler 1024
    TCNT1 = 3036;                      // Initial count
    TIMSK1 |= (1 << TOIE1);             // Enable overflow interrupt
}

int main() {
    DDRB = 0xFF;
    setup_timer1();
    sei();  // Enable interrupts

    // Knight Rider LEDs on PB0-PB3
    uint8_t pattern[] = {0x01, 0x02, 0x04, 0x08, 0x04, 0x02};
    uint8_t i = 0;

    while (1) {
        PORTB = (PORTB & 0xF0) | pattern[i];
        i = (i + 1) % 6;
        _delay_ms(100);
    }
}
