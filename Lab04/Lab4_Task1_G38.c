#include <avr/io.h>

int main(void) {
    // configure Pin 6 as output
    DDRD |= (1 << PD6);
    
    // configure Fast PWM mode
    // WGM01=1, WGM00=1 for Fast PWM mode
    TCCR0A |= (1 << WGM01) | (1 << WGM00);
    
    // configure non-inverting mode
    // COM0A1=1, COM0A0=0 to get a non-inverting PWM on OC0A
    TCCR0A |= (1 << COM0A1);
    
    // set duty cycle to 50%
    OCR0A = 127;
    
    // start timer with prescaler of 64
    TCCR0B |= (1 << CS01) | (1 << CS00);
    
    while(1) {

    }
    
    return 0;
}