#include <avr/io.h>
#include <util/delay.h>

#define KNIGHT_DELAY_MS 200
#define TONE_FREQUENCY 1000  // 1 kHz tone

void pwm_init() {
    // Set PD6 (OC0A / Arduino pin 6) as output
    DDRD |= (1 << PD6);

    // Set Fast PWM mode, non-inverting, prescaler = 64
    TCCR0A |= (1 << COM0A1) | (1 << WGM01) | (1 << WGM00);
    TCCR0B |= (1 << CS01) | (1 << CS00); // prescaler 64

    // Calculate OCR0A for desired frequency
    // F_pwm = F_CPU / (N * 256)
    // => OCR0A = (F_CPU / (N * F_pwm)) - 1
    // For Timer0 with 64 prescaler and 1kHz: OCR0A ≈ (16MHz / (64 * 1000)) - 1 = ~249
    OCR0A = 249; // Set TOP (actually fixed at 255 in Fast PWM, but adjusts duty)
    OCR0A = 128; // 50% duty cycle
}

void pwm_stop() {
    TCCR0A &= ~(1 << COM0A1); // Disconnect OC0A
    PORTD &= ~(1 << PD6);     // Set pin low
}

int main(void) {
    // Set PB0–PB3 (Arduino D8–D11) as outputs for LEDs
    DDRB |= 0x0F;

    // Initialize PWM buzzer on PD6
    pwm_init();

    // Knight Rider LED sequence: A → B → C → D → C → B
    uint8_t pattern[] = {0x01, 0x02, 0x04, 0x08, 0x04, 0x02};

    while (1) {
        for (int i = 0; i < 6; i++) {
            PORTB = (PORTB & ~0x0F) | pattern[i];
            _delay_ms(KNIGHT_DELAY_MS);
        }
    }

    pwm_stop();
    return 0;
}

