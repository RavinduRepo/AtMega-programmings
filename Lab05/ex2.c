#include <avr/io.h>
#include <util/delay.h>

void adc_init() {
    // Enable ADC
    ADCSRA |= (1 << ADEN);
    
    // Set ADC prescaler to 128 (16MHz/128 = 125kHz)
    ADCSRA |= (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);
    
    // Set voltage reference to external AREF and select ADC0 channel
    // Right justify result (ADLAR = 0 for full 10-bit precision)
    ADMUX &= ~(1 << REFS1);  // Clear REFS1
    ADMUX &= ~(1 << REFS0);  // Clear REFS0 (external AREF)
    ADMUX &= ~(1 << ADLAR);  // Right justify
    ADMUX &= ~((1 << MUX3) | (1 << MUX2) | (1 << MUX1) | (1 << MUX0)); // Select ADC0
}

uint16_t adc_read() {
    // Start conversion
    ADCSRA |= (1 << ADSC);
    
    // Wait for conversion complete
    while (!(ADCSRA & (1 << ADIF)));
    
    // Read 10-bit result (right-justified)
    uint16_t result = ADCL;  // Read low byte first
    result |= (ADCH << 8);   // Combine with high byte
    
    // Clear interrupt flag
    ADCSRA |= (1 << ADIF);
    
    return result;
}

int main() {
    // Make ADC0 pin input (PC0) - already input by default
    DDRC &= ~(1 << PC0);
    
    // Make PD0 output for LED
    DDRD |= (1 << PD0);
    
    // Initialize ADC
    adc_init();
    
    // Define light threshold
    // Lower values = darker conditions
    uint16_t dark_threshold = 15;
    
    while(1) {
        // Read light sensor value
        uint16_t light_value = adc_read();
        
        // If it's dark (low light value), turn on LED
        if (light_value < dark_threshold) {
            PORTD |= (1 << PD0);   // Turn on LED
        } else {
            PORTD &= ~(1 << PD0);  // Turn off LED
        }
        
        _delay_ms(100);  // Small delay for stability
    }
    
    return 0;
}
