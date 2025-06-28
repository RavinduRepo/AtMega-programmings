#include <avr/io.h>
#include <util/delay.h>

void adc_init() {
    // Enable ADC
    ADCSRA |= (1 << ADEN);
    
    // Set ADC prescaler to 128 (16MHz/128 = 125kHz)
    ADCSRA |= (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);
    
    // Set voltage reference to AVCC and select ADC1 channel
    // Left justify result for easier 8-bit reading
    ADMUX |= (1 << REFS0) | (1 << ADLAR) | (1 << MUX0);
}

uint16_t adc_read() {
    // Start conversion
    ADCSRA |= (1 << ADSC);
    
    // Wait for conversion complete
    while (!(ADCSRA & (1 << ADIF)));
    
    // Read result (left-justified, so we use ADCH for 8-bit display)
    return ADCH;
}

int main() {
    // Make ADC1 pin input
    DDRC &= ~(1 << PC1);  // ADC1 is on PC1
    
    // Make Port D output for LEDs
    DDRD = 0xFF;
    
    // Initialize ADC
    adc_init();
    
    while(1) {
        // Read ADC value
        uint8_t adc_value = adc_read();
        
        // Display on LEDs (8-bit representation)
        PORTD = adc_value;
        
        // Clear ADC interrupt flag
        ADCSRA |= (1 << ADIF);
        
        _delay_ms(100);
    }
    
    return 0;
}
