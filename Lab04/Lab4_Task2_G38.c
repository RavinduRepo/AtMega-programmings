#include <avr/io.h>
#include <util/delay.h>

// Function to set PWM frequency by changing prescaler
void setPWMFrequency(uint8_t prescaler) {
    // Stop timer first
    TCCR0B &= ~((1 << CS02) | (1 << CS01) | (1 << CS00));
    
    // Set new prescaler
    TCCR0B |= prescaler;
}

int main(void) {
    // configure Pin 6 as output
    DDRD |= (1 << PD6);
    
    // configure Fast PWM mode, non-inverting
    TCCR0A |= (1 << WGM01) | (1 << WGM00);
    TCCR0A |= (1 << COM0A1);                    
    
    // set 50% duty cycle for moderate volume
    OCR0A = 127;
    
    while(1) {
        // frequency 1= ~7.8kHz (Prescaler 8)
        setPWMFrequency((1 << CS01));
        _delay_ms(1000);
        
        // frequency 2= ~976Hz (Prescaler 64)
        setPWMFrequency((1 << CS01) | (1 << CS00));
        _delay_ms(1000);
        
        // frequency 3= ~244Hz (Prescaler 256)
        setPWMFrequency((1 << CS02));
        _delay_ms(1000);
        
        // Frequency 4= ~61Hz (Prescaler 1024)
        setPWMFrequency((1 << CS02) | (1 << CS00));
        _delay_ms(1000);  // Play for 1 second
        
        // brief pause between cycles
        TCCR0B &= ~((1 << CS02) | (1 << CS01) | (1 << CS00)); // Stop timer
        _delay_ms(1000);
    }
    
    return 0;
}