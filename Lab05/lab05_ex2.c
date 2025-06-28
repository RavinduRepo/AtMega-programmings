#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>

void ADC_init() {
    ADMUX = (1 << ADLAR);  // External AREF, Left Adjust, ADC0
    ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1); // Enable ADC, prescaler = 64
}

uint8_t ADC_read() {
    ADCSRA |= (1 << ADSC);              // Start conversion
    while (ADCSRA & (1 << ADSC));       // Wait for conversion
    return ADCH;                        // Use high 8-bits
}

int main(void) {
    DDRC &= ~(1 << PC0);   // ADC0 input
    DDRD |= (1 << PD0);    // LED output

    ADC_init();

    while (1) {
        uint8_t light_value = ADC_read();
        if (light_value < 100) {        // Lower ADC value = darker
            PORTD |= (1 << PD0);        // Turn ON LED
        } else {
            PORTD &= ~(1 << PD0);       // Turn OFF LED
        }
        _delay_ms(200);
    }
}

