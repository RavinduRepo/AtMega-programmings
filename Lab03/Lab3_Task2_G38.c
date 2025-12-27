#include <avr/io.h>

void delay_500ms() { 
  for (int i = 0; i < 125; i++) {
    TCNT0 = 6;               // Load initial value
    TCCR0A = 0x00;			// Normal Mode operation
    TCCR0B = (1 << CS02);  // Prescaler = 256

    while ((TIFR0 & (1 << TOV0)) == 0); // Wait for overflow

    TIFR0 |= (1 << TOV0);     // Clear overflow flag
  }
  TCCR0B = 0x00;            // Stop timer
}

int main(void) {
    DDRB |= (1 << PB5);       // Set PB5 as output

    while (1) {
        PORTB ^= (1 << PB5);  // Toggle PB5
        delay_500ms();
    }
}