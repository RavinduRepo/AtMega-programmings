// -------------------------------------------------------------
// University of Peradeniya - Faculty of Engineering
// Mid-Semester Examination - July 2025
// CO321 Embedded Systems
// -------------------------------------------------------------
// Registration Number: E/20/280
// -------------------------------------------------------------

// Include library files here
#include <avr/interrupt.h>
#include <avr/io.h>
#include <util/delay.h>

// Define your global variables/functions here
volatile uint8_t list[] = {0b00000010, 0b00000100, 0b00001000, 0b00000100};
volatile uint8_t pattern_count = -1; // to start from 0
volatile uint8_t for_loop_count = 0;

volatile uint8_t is_play_B = 1;

volatile uint8_t is_play_C = 1;

void setup_timer2_for_pwm() {
    // Set PB3 (OC2A) as output
    DDRB |= (1 << PB3);

    // FAST PWM, non-inverting mode on OC2A
    TCCR2A = (1 << COM2A1) | (1 << WGM21) | (1 << WGM20);
    TCCR2B = (1 << CS21); // Prescaler 8 -> 490 Hz PWM frequency

    OCR2A = 0; // Start with zero
}

void stop_timer2_for_pwm() {
    TCCR2A = (0 << COM2A1) | (1 << WGM21) | (1 << WGM20);
    TCCR2B = (1 << CS21) | (1 << CS20);
    OCR2A = 0;
}


// Main Function
int main (void){
    DDRB |= (1 << PB1) | (1 << PB2) | (1 << PB3); // Set PB1, 2, 3 as output

    sei(); // global interrupt

    // Timer 0 setup
    TCCR0A = 0; // Normal mode
    TCCR0B = (1 << CS02) | (1 << CS00); // Prescaler 1024 // Set this to 0x00 to stop the timer
    TCNT0 = 131;                      // Initial count
    TIMSK0|= (1 << TOIE0);             // Enable overflow interrupt

    // Enable external interrupts
    // Enable external interrupt on INT0 (PD3)
    EICRA |= (1 << ISC11) | (1 << ISC10); // Falling edge triggers interrupt
    EIMSK |= (1 << INT1);  // Enable INT1

    while (1)
    {
        if (is_play_B == 0)
        {
            PORTB ^=  0b00000100;
            _delay_ms(500);
        }
        else if (is_play_C == 0)
        {
            setup_timer2_for_pwm();
            OCR2A = 0;
            for (int i = 0; i < 256; i++) {
                if (is_play_C == 0)
                {              
                    OCR2A = i;
                    _delay_ms(10);
                }
            }
            for (int i = 254; i > 0; i--) {
                if (is_play_C == 0) {
                    OCR2A = i;
                    _delay_ms(10);
                }
            }
        }
        stop_timer2_for_pwm();
        
    }
}

// External Intererupt 1 Service Routine
ISR(INT1_vect){
    if(((pattern_count % 4) == 1) || (pattern_count % 4) == 3){
        // togggle to stop
        is_play_B ^= 1;
    } else if ((pattern_count % 4) == 2)
    {
        is_play_C ^= 1;
    }
    
}


// Timer0 Overflow Interrupt Service Routine
ISR(TIMER0_OVF_vect){
    if ((is_play_B == 1 & is_play_C == 1) ) // neither stop at B or C
    {
        if (for_loop_count == 125) {
            // animation
            pattern_count += 1;
            PORTB = 0;
            PORTB = list[pattern_count % 4];
            
            for_loop_count = 0;
        }
        for_loop_count++;
        TCNT0 = 131;
    }
    
}

































// <
// task1 working
// // -------------------------------------------------------------
// // University of Peradeniya - Faculty of Engineering
// // Mid-Semester Examination - July 2025
// // CO321 Embedded Systems
// // -------------------------------------------------------------
// // Registration Number: E/20/280
// // -------------------------------------------------------------

// // Include library files here
// #include <avr/interrupt.h>
// #include <avr/io.h>
// #include <util/delay.h>

// // Define your global variables/functions here
// volatile uint8_t list[] = {0b00000010, 0b00000100, 0b00001000, 0b00000100};
// volatile uint8_t pattern_count = 0;
// // volatile uint8_t is_play_B = 1;
// volatile uint8_t for_loop_count = 0;

// // Main Function
// int main (void){
//     DDRB |= (1 << PB1) | (1 << PB2) | (1 << PB3); // Set PB1, 2, 3 as output
//     // DDRD &= ~(1 << PD3); // Set PD3 as input
//     // PORTD |= (1 << PD3); // Enable pull-up resistor on PD3

//     sei(); // global interrupt

//     // Timer 0 setup
//     TCCR0A = 0; // Normal mode
//     TCCR0B = (1 << CS02) | (1 << CS00); // Prescaler 1024 // Set this to 0x00 to stop the timer
//     TCNT0 = 131;                      // Initial count
//     TIMSK0|= (1 << TOIE0);             // Enable overflow interrupt

//     while (1)
//     {
     
//     }
    
// }

// // External Intererupt 1 Service Routine
// ISR(INT1_vect){
    
// }

// // Timer0 Overflow Interrupt Service Routine
// ISR(TIMER0_OVF_vect){
//     if (for_loop_count == 125) {
//         // animation
//         PORTB = 0;
//         PORTB = list[pattern_count % 4];
//         pattern_count += 1;

//         for_loop_count = 0;
//     }
//     for_loop_count++;
//     TCNT0 = 131;

// }






// task2 working
// // -------------------------------------------------------------
// // University of Peradeniya - Faculty of Engineering
// // Mid-Semester Examination - July 2025
// // CO321 Embedded Systems
// // -------------------------------------------------------------
// // Registration Number: E/20/280
// // -------------------------------------------------------------

// // Include library files here
// #include <avr/interrupt.h>
// #include <avr/io.h>
// #include <util/delay.h>

// // Define your global variables/functions here
// volatile uint8_t list[] = {0b00000010, 0b00000100, 0b00001000, 0b00000100};
// volatile uint8_t pattern_count = -1; // to start from 0
// volatile uint8_t for_loop_count = 0;

// volatile uint8_t is_play_B = 1;


// // Main Function
// int main (void){
//     DDRB |= (1 << PB1) | (1 << PB2) | (1 << PB3); // Set PB1, 2, 3 as output

//     sei(); // global interrupt

//     // Timer 0 setup
//     TCCR0A = 0; // Normal mode
//     TCCR0B = (1 << CS02) | (1 << CS00); // Prescaler 1024 // Set this to 0x00 to stop the timer
//     TCNT0 = 131;                      // Initial count
//     TIMSK0|= (1 << TOIE0);             // Enable overflow interrupt

//     // Enable external interrupts
//     // Enable external interrupt on INT0 (PD3)
//     EICRA |= (1 << ISC11) | (1 << ISC10); // Falling edge triggers interrupt
//     EIMSK |= (1 << INT1);  // Enable INT1

//     while (1)
//     {
//         if (is_play_B == 0)
//         {
//             PORTB ^=  0b00000100;
//             _delay_ms(500);
//         }
//     }
// }

// // External Intererupt 1 Service Routine
// ISR(INT1_vect){
//     if(((pattern_count % 4) == 1) || (pattern_count % 4) == 3)
//     // togggle to stop
//     is_play_B ^= 1;
// }



// // Timer0 Overflow Interrupt Service Routine
// ISR(TIMER0_OVF_vect){
//     if (is_play_B == 1)
//     {
//         if (for_loop_count == 125) {
//             // animation
//             pattern_count += 1;
//             PORTB = 0;
//             PORTB = list[pattern_count % 4];
            
//             for_loop_count = 0;
//         }
//         for_loop_count++;
//         TCNT0 = 131;
//     }
    
// }

