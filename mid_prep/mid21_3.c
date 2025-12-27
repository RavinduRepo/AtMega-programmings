#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
volatile uint8_t for_loop_count = 0;
volatile uint8_t pattern_count = 0;
volatile uint8_t list[] = {0b00000010, 0b00000100, 0b00001000, 0b00010000, 0b00100000, 0b00010000, 0b00001000, 0b00000100};
volatile uint8_t is_play = 1;
volatile uint8_t is_fade = 0;

void stop_timer2_for_pwm() {
    TCCR2A = (0 << COM2A1) | (1 << WGM21) | (1 << WGM20);
    TCCR2B = (1 << CS21) | (1 << CS20);
    OCR2A = 0;
}

void knightrider() {
    pattern_count += 1;
    PORTB = list[pattern_count % 8] & 0b00111110;
}

ISR(TIMER0_OVF_vect) {
    if (is_play != 0) {
        stop_timer2_for_pwm();
        if ((for_loop_count == 20)) {
            knightrider();
            for_loop_count = 0;
        }
        for_loop_count++;
    }
    TCNT0 = 100;
}

ISR(INT1_vect) {
    is_play ^= 1;
    if ((is_play == 0) && (((pattern_count % 8) == 2) || ((pattern_count % 8) == 6))) {
        is_fade = 1;
    } else {
        is_fade = 0;
        stop_timer2_for_pwm();
    }
}
// pwm_tables : Waveform Generation Mode Bit Description
// clock_prescalers_table : Clock Select Bit Description
void setup_timer0() {
    TCCR0A = 0; // Normal mode
    TCCR0B = (1 << CS02) | (1 << CS00); // Prescaler 1024 // Set this to 0x00 to stop the timer
    TCNT0 = 100;                      // Initial count
    TIMSK0 |= (1 << TOIE0);             // Enable overflow interrupt
}

void setup_timer2_for_pwm() {
    // Set PB3 (OC2A) as output
    DDRB |= (1 << PB3);

    // FAST PWM, non-inverting mode on OC2A
    TCCR2A = (1 << COM2A1) | (1 << WGM21) | (1 << WGM20);
    TCCR2B = (1 << CS21); // Prescaler 8 -> 490 Hz PWM frequency

    OCR2A = 0; // Start with zero
}

int main(void) {
    // Initialize ports
    DDRB |= (1 << PB5) | (1 << PB4) | (1 << PB3) | (1 << PB2) | (1 << PB1);
    DDRD |= (1 << PD3);

    // Enable external interrupt on INT1 (PD3)
    EICRA |= (1 << ISC11); // Falling edge triggers interrupt
    EIMSK |= (1 << INT1);  // Enable INT1

    sei();
    setup_timer0();

    // Main loop
    while (1) {
        if (is_fade == 1 && is_play == 0) {
            setup_timer2_for_pwm();
            for (int i = 254; i > 0; i--) {
                OCR2A = i;
                _delay_ms(10);
            }
            for (int i = 0; i < 256; i++) {
                OCR2A = i;
                _delay_ms(10);
            }
        }
    }
    return 0;
}