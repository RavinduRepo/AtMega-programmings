#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>


volatile uint8_t toggle = 0;
ISR(TIMER1_OVF_vect) {
    PORTB = PORTB ^ (1 << PB5);
    // if (toggle){
    //     PORTB |= (1 << PB5);
    // }
    // else {
    //     PORTB &= ~(1 << PB5);
    // }
}

void setup_timer1() {
    TCCR1A = 0; // Normal mode
    TCCR1B = (1 << CS12); // Prescaler 1024 // Set this to 0x00 to stop the timer
    TCNT1 = 3036;                      // Initial count
    TIMSK1 |= (1 << TOIE1);             // Enable overflow interrupt
}

int main(void) {
    // Initialize ports
    DDRB = 0xFF; // PB5 is a output to toggle / rest to knight rider
    setup_timer1();
    sei();
    uint8_t list[] = {0b00000001, 0b00000010, 0b00000100, 0b00001000, 0b00000100, 0b00000010};
    uint8_t i = 0;
    // Main loop
    while (1) {
        PORTB = (PORTB & 0xF0) | list[i];
        i = (i + 1) % 6;
        _delay_ms(200);

    }
    return 0;
}

