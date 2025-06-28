# Default board port
DEFAULT_PORT = /dev/ttyUSB0

# Compiler and flags
CC = avr-gcc
OBJCOPY = avr-objcopy
AVRDUDE = avrdude
CFLAGS = -Os -DF_CPU=16000000UL -mmcu=atmega328p

# Targets
all:
	@echo "Usage: make filename=<path/to/filename.c> [boardport=<port>]"

upload:
	@if [ "$(filename)" = "" ]; then \
		echo "Error: Please specify a filename (e.g., make filename=path/to/filename.c)"; \
		exit 1; \
	fi
	@if [ "$(boardport)" = "" ]; then \
		boardport=$(DEFAULT_PORT); \
	fi; \
	$(CC) $(CFLAGS) -o $(basename $(notdir $(filename))) $(filename) && \
	$(OBJCOPY) -O ihex -R .eeprom $(basename $(notdir $(filename))) $(basename $(notdir $(filename))).hex && \
	$(AVRDUDE) -F -V -c arduino -p ATMEGA328P -P $$boardport -b 115200 -U flash:w:$(basename $(notdir $(filename))).hex

# Clean up generated files
clean:
	rm -f *.hex *.o
