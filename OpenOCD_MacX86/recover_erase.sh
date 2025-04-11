#!/bin/bash
 
# Function to prompt user for confirmation
ask() {
    echo
    echo "Recover Device - ALL DATA WILL BE ERASED?"
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
	-c "reset_config srst_nogate" \
	-c "reset halt" \
	-c "flash erase_address 0x08000000 0x08180000" \
	-c reset \
    -c exit