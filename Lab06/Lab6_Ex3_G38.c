//  Group 38
#define F_CPU 16000000UL  // 16 MHz clock speed
#define BAUD 9600
#define MYUBRR F_CPU/16/BAUD-1
#define BUFFER_SIZE 128

#include <avr/io.h>
#include <stdbool.h>

void usart_init(unsigned int ubrr) {
    // Set baud rate
    UBRR0H = (unsigned char)(ubrr >> 8 );
    UBRR0L = (unsigned char)ubrr;

    // Enable receiver and transmitter
    UCSR0B = (1 << RXEN0) | (1 << TXEN0  );    

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




char caesar_cipher(char c) {
    if (c >= 'A' && c <= 'Z')
        return ((c - 'A' + 3) % 26) + 'A';
    else if (c >= 'a' && c <= 'z')
        return ((c - 'a' + 3) % 26) + 'a';
    else
        return c;
}

void encrypt_and_send(const char* str) {
    while (*str) {
        usart_send(caesar_cipher(*str));
        str++;
    }
}

int main(void) {
    usart_init(MYUBRR);
    char buffer[BUFFER_SIZE];
    int index = 0;

    while (1) {
        char c = usart_receive();

        // Carriage return = end of sentence
        if (c == '\r' || index >= BUFFER_SIZE - 1) {
            buffer[index] = '\0';
            encrypt_and_send(buffer);
            usart_send('\n');
            index = 0;  // Reset buffer
        } else {
            buffer[index++] = c;
        }
    }
}
