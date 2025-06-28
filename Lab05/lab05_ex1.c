#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>

void ADC_init() {
    ADMUX = (1 << REFS0) | (1 << ADLAR) | (1 << MUX0);  // AVCC as Vref, Left adjust, ADC1
    ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0); // Enable ADC, prescaler = 64
}

uint8_t ADC_read() {
    ADCSRA |= (1 << ADSC);              // Start conversion
    while (ADCSRA & (1 << ADSC));       // Wait for conversion to finish
    return ADCH;                        // Only use high 8 bits (left-justified)
}

int main(void) {
    DDRC &= ~(1 << PC1);  // Set PC1 (ADC1) as input
    DDRD = 0xFF;          // Set PORTD as output for LEDs

    ADC_init();

    while (1) {
        uint8_t adc_value = ADC_read();
        PORTD = adc_value;  // Show ADC high 8 bits on LEDs
        _delay_ms(200);     // Delay for visibility
    }
}

