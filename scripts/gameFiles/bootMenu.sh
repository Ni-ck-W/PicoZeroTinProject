#!/bin/bash

# Function: Convert x/c input to decimal
binary_to_decimal() {
    local input=$1
    local binary=""

    # Convert each character
    for ((i=0; i<${#input}; i++)); do
        char="${input:i:1}"
        case "$char" in
            x|X)
                binary+="1"
                ;;
            c|C)
                binary+="0"
                ;;
            *)
                echo "Invalid character '$char' in input!"
                return 1
                ;;
        esac
    done

    # Convert binary string to decimal
    echo $((2#$binary))
}

# Function: Display menu
menu() {
    echo "This menu uses a binary system for input (x=1, c=0)"
    echo "System Menu:"
    echo "0. Shutdown"
    echo "1. Pico-8"
    echo "2. Doom"
    echo "3. Doom 2"
    echo "4. RetroArch"
    echo "5. Super Mario 64"
    echo -n "Enter choice in binary (x/c): "
    read userInput

    # Convert to decimal
    decimalChoice=$(binary_to_decimal "$userInput") || return

    echo "Decimal choice: $decimalChoice"

    # Handle menu options dynamically
    case $decimalChoice in
        0)
            echo "Shutting down..."
            shutdown 0
            exit 0
            ;;
        1)
            startx ./pico-8/pico8 -splore
            ;;
        2)
            startx ./doom1.sh
            ;;
        3)
            startx chocolate-doom
            ;;
        4)
            startx retroarch
            ;;
        5)
            startx ./sm64.sh
            ;;
        *)
            echo "Invalid choice!"
            sleep 3
            ;;
    esac
}

# Main loop
while true; do
    clear
    menu
done
