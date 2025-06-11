#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    // configure Pin 6 as output
    DDRD |= (1 << PD6);
    
    // configure Fast PWM mode, non-inverting
    TCCR0A |= (1 << WGM01) | (1 << WGM00);      
    TCCR0A |= (1 << COM0A1);                    

    // start timer with prescaler of 64
    TCCR0B |= (1 << CS01) | (1 << CS00);
    
    while(1) {
        // fade IN 0% to 100% brightness
        for(int brightness = 0; brightness <= 255; brightness++) {
            OCR0A = brightness;      
            _delay_ms(10);          
        }
        
        // fade OUT 100% to 0% brightness
        for(int brightness = 255; brightness >= 0; brightness--) {
            OCR0A = brightness;      
            _delay_ms(10);          
        }
    }
    
    return 0;
}