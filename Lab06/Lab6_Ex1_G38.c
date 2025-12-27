//  Group 38
#define F_CPU 16000000UL  // 16 MHz clock speed
#define BAUD 9600
#define MYUBRR F_CPU/16/BAUD-1

#include <avr/io.h>

void usart_init(unsigned int ubrr) {
    // Set baud rate
    UBRR0H = (unsigned char)(ubrr >> 8);
    UBRR0L = (unsigned char)ubrr;

    // Enable receiver and transmitter
    UCSR0B = (1 << RXEN0) | (1 << TXEN0);

    // Set frame: 8 data bits, 1 stop bit, no parity (asynchronous)
    UCSR0C = (1 << UCSZ01) | (1 << UCSZ00);
}

void usart_send(char data) {
    while (!(UCSR0A & (1 << UDRE0)));  // Wait until buffer is empty
    UDR0 = data;
}

char usart_receive(void) {
    while (!(UCSR0A & (1 << RXC0)));   // Wait until data is received
    return UDR0;
}

int main(void) {
    usart_init(MYUBRR);

    while (1) {
        char c = usart_receive();  // Wait and read
        usart_send(c);            // Echo back
    }
}
