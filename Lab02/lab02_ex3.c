#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define BLINK_DELAY_MS 100

// define a count variable
volatile uint8_t count = 0;

int main(){

    DDRD &= ~(1<<2); //PD2 (INT0) is input
    DDRB |= 0x3F;    // PORTB lower 6 bits as output

    EICRA |= (1<<ISC01); //set for falliing edge detection
    EICRA &= ~(1<<ISC00); //set for falliing edge detection

    sei(); //enable global interrupts

    EIMSK |= (1<<INT0); //enable external interrupt for int0


    while(1){ // this loop 
    }
    return 0;
}

ISR(INT0_vect){
    // make a bonary counter on PORTB
    if (!(PIND & (1 << PD7))) {
        count++;
        PORTB = (PORTB & 0xC0) | (count & 0x3F);
        // delay
        _delay_ms(50);   // Debounce
    }
}
