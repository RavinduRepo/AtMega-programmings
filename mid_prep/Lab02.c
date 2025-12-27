#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

volatile uint8_t count = 0;

ISR(INT0_vect){
    _delay_ms(500);
    count *= 2;
    PORTB = count & 0b00111111;
}

ISR(INT1_vect){
    _delay_ms(500);
    count = count * 2 + 1;
    PORTB = count & 0b00111111; 
}

void main(void) {
    // Initialize ports
    DDRB |= 0b00111111;
    DDRD &= ~(1 << PD2);
    DDRD &= ~(1 << PD3);


    EICRA |= (1 << ISC01); // edge
    EICRA &= ~(1 << ISC00); // edge
    EIMSK |= (1 << INT0); // inttr0

    EICRA |= (1 << ISC11); // edge
    EICRA &= ~(1 << ISC10); // edge
    EIMSK |= (1 << INT1); // inttr1    


    sei(); // Glob

    // Main loop
    while (1) {
        
        }
}








































// ATmega328P Interrupt Vector Table (Prioritized Order, Highest to Lowest)
// (Lower address = higher priority)
//
// | Priority | Vector Name         | Interrupt Source                       | Typical Usage                    |
// |----------|---------------------|----------------------------------------|----------------------------------|
// | 1        | RESET_vect          | Reset                                  | Power-on or external reset       |
// | 2        | INT0_vect           | External Interrupt Request 0 (PD2)     | Arduino pin 2                    |
// | 3        | INT1_vect           | External Interrupt Request 1 (PD3)     | Arduino pin 3                    |
// | 4        | PCINT0_vect         | Pin Change Interrupt Request 0 (PB)    | Port B pins                      |
// | 5        | PCINT1_vect         | Pin Change Interrupt Request 1 (PC)    | Port C pins                      |
// | 6        | PCINT2_vect         | Pin Change Interrupt Request 2 (PD)    | Port D pins                      |
// | 7        | WDT_vect            | Watchdog Time-out Interrupt            | Watchdog timer                   |
// | 8        | TIMER2_COMPA_vect   | Timer/Counter2 Compare Match A         | Timer2 compare match A           |
// | 9        | TIMER2_COMPB_vect   | Timer/Counter2 Compare Match B         | Timer2 compare match B           |
// | 10       | TIMER2_OVF_vect     | Timer/Counter2 Overflow                | Timer2 overflow                  |
// | 11       | TIMER1_CAPT_vect    | Timer/Counter1 Capture Event           | Timer1 input capture             |
// | 12       | TIMER1_COMPA_vect   | Timer/Counter1 Compare Match A         | Timer1 compare match A           |
// | 13       | TIMER1_COMPB_vect   | Timer/Counter1 Compare Match B         | Timer1 compare match B           |
// | 14       | TIMER1_OVF_vect     | Timer/Counter1 Overflow                | Timer1 overflow                  |
// | 15       | TIMER0_COMPA_vect   | Timer/Counter0 Compare Match A         | Timer0 compare match A           |
// | 16       | TIMER0_COMPB_vect   | Timer/Counter0 Compare Match B         | Timer0 compare match B           |
// | 17       | TIMER0_OVF_vect     | Timer/Counter0 Overflow                | Timer0 overflow                  |
// | 18       | SPI_STC_vect        | SPI Serial Transfer Complete           | SPI transfer complete            |
// | 19       | USART_RX_vect       | USART Rx Complete                      | Serial receive complete          |
// | 20       | USART_UDRE_vect     | USART Data Register Empty              | Serial transmit buffer empty     |
// | 21       | USART_TX_vect       | USART Tx Complete                      | Serial transmit complete         |
// | 22       | ADC_vect            | ADC Conversion Complete                | ADC conversion complete          |
// | 23       | EE_READY_vect       | EEPROM Ready                           | EEPROM write complete            |
// | 24       | ANALOG_COMP_vect    | Analog Comparator                      | Analog comparator event          |
// | 25       | TWI_vect            | Two-wire Serial Interface (I2C)        | I2C/TWI event                    |
// | 26       | SPM_READY_vect      | Store Program Memory Ready             | SPM ready (self-programming)     |
//
// Example usage:
// ISR(TIMER1_COMPA_vect) {
//     // Your interrupt code here
// }