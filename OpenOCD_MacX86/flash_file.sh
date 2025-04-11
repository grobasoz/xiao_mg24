#!/bin/bash
 
# Check if a firmware hex file was provided as an argument
if [ -z "$1" ]; then
    echo "No firmware hex file was provided!"
    exit 1
fi
 
# Check if the provided file exists
if [ ! -f "$1" ]; then
    echo "Firmware hex file was not found!"
    exit 1
fi
 
hexfile="$1"
 
# Function to prompt user for confirmation
ask() {
    echo
    echo "Flash Image \"$hexfile\"?"
    read -p "Press Y or Enter to continue or N to exit: " choice
 
    # Convert choice to uppercase for case-insensitive comparison
    choice=$(echo "$choice" | tr '[:lower:]' '[:upper:]')
 
    if [ "$choice" = "N" ]; then
        return 1 # Exit
    elif [ "$choice" = "Y" ] || [ -z "$choice" ]; then
        return 0 # Continue
    else
        ask # Re-prompt if invalid input
    fi
}
 
# Call the ask function and check the return status
if ! ask; then
    exit 0
fi
 
# Execute the OpenOCD command
./bin/openocd \
    -s scripts \
    -f interface/cmsis-dap.cfg \
    -c "transport select swd" \
    -f target/efm32s2_g23.cfg \
    -c init \
    -c halt \
    -c "flash probe 0" \
    -c "flash banks" \
    -c "flash list" \
    -c "flash write_image erase \"$hexfile\"" \
    -c "verify_image \"$hexfile\"" \
    -c "reset run" \
    -c exit