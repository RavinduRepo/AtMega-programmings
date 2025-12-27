#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

volatile uint8_t for_loop_count = 0;
volatile uint8_t pattern_count = 0;
volatile uint8_t list[] = {0b00000010, 0b00000100, 0b00001000, 0b00010000, 0b00100000, 0b00010000, 0b00001000, 0b00000100};

void knightrider() {
    PORTB = 0;
    PORTB = list[pattern_count % 8];
    pattern_count += 1;
}

ISR(TIMER0_OVF_vect) {
    if (for_loop_count == 20) {
        knightrider();
        for_loop_count = 0;
    }
    for_loop_count++;
    TCNT0 = 100;
}

void setup_timer0() {
    TCCR0A = 0; // Normal mode
    TCCR0B = (1 << CS02) | (1 << CS00); // Prescaler 1024 // Set this to 0x00 to stop the timer
    TCNT0 = 100;                      // Initial count
    TIMSK0 |= (1 << TOIE1);             // Enable overflow interrupt
}

int main(void) {
    // Initialize ports
    DDRB |= (1<<PB5) | (1<<PB4) | (1<<PB3) | (1<<PB2) | (1<<PB1);
    sei();
    setup_timer0();

    // Main loop
    while (1) {
    }
    return 0;
}