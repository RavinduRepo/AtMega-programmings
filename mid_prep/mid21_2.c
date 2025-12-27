#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

volatile uint8_t for_loop_count = 0;
volatile uint8_t pattern_count = 0;
volatile uint8_t list[] = {0b00000010, 0b00000100, 0b00001000, 0b00010000, 0b00100000, 0b00010000, 0b00001000, 0b00000100};
volatile uint8_t is_pressed = 1;

void knightrider() {
    PORTB = list[pattern_count % 8] & 0b00111110;
    pattern_count += 1;
}

ISR(TIMER0_OVF_vect) {
    if (is_pressed != 0) {
        if ((for_loop_count == 20)) {
            knightrider();
            for_loop_count = 0;
        }
        for_loop_count++;
    }
    TCNT0 = 100;
}

ISR(INT1_vect) {
    is_pressed ^= 1;
}

void setup_timer0() {
    TCCR0A = 0; // Normal mode
    TCCR0B = (1 << CS02) | (1 << CS00); // Prescaler 1024 // Set this to 0x00 to stop the timer
    TCNT0 = 100;                      // Initial count
    TIMSK0 |= (1 << TOIE0);             // Enable overflow interrupt
}

int main(void) {
    // Initialize ports
    DDRB |= (1<<PB5) | (1<<PB4) | (1<<PB3) | (1<<PB2) | (1<<PB1);
    DDRD |= (1<<PD3);

    // Enable external interrupt on INT1 (PD3)
    EICRA |= (1 << ISC11); // Falling edge triggers interrupt
    EIMSK |= (1 << INT1);  // Enable INT1

    sei();
    setup_timer0();

    // Main loop
    while (1) {
    }
    return 0;
}