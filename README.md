# Seeed Studio XIAO MG24
## Development Overview

The Seeed Studio XIAO MG24 features a built in CMSIS-DAP based OpenOCD flash programmer via SWD

This allows pogramming and debugging via OpenOCD, even while the USB serial port is connected!

**NB.**
These applications use the XIAO MG24 without the "Sense" additions
*Due to the lack of an IMU Interrupt and the use of a 6 DOF IMU, I would prefer to use a standalone IMU for low power or high speed sensing*

<hr>

### Projects and firmware.

* OpenOCD programming and debugging

* Test firmware

* Zigbee NCP (Network Co Processor)

* Bluetooth NCP (Network Co Processor)

* Zigbee2MQTT Testing

## Folders

### OpenOCD 
* Batch files - called from this folder to perform various tasks, like programming and debugging code

### firmware
* Test firmware for the XIAO MG24

### Zigbee2MQTT
* Zigbee2MQTT "Coordinator" test setup

### assets
* Various images etc for the ReadMe files