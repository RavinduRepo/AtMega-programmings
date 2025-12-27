#include <avr/io.h>
#include <util/delay.h>


int main(void) {
    // Initialize ports
    DDRD |= 0x0F; // Set PD2 as output
    uint8_t list[] = {0x01, 0x02, 0x04, 0x08, 0x04, 0x02};
    while (1) {
        for (int i = 0; i < 6; i++) {
            PORTD = (PORTD & ~0x0F) | list[i];
            _delay_ms(100);
        }
    }
}