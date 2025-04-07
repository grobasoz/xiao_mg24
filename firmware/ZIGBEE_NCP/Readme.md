## Zigbee NCP for the XIAO_MG24

#### Use with Zigbee2MQTT 

### Firmware

There are two versions, each with a *hex* file and *gbl* file

1. The *hex* file is used with the OpenOCD batch files for programming and verifying

2. The *gbl* file is for use with the Gecko Bootloader when the device is started in Bootloader Mode

There are two versions of the NCP firmware, *non-UFL* and *UFL*

1. The *non-UFL* uses the chip antenna on the XIAO MG24

2. The *UFL* version uses the UFL connector and requires a 2.4GHz antenna to be attached 

### Notes:

The bootloader GPIO activation is via XIAO MG24 - D10 (PA5). Pulling low during reset will cause the device to enter the bootloader. 

The following prompt is presented on a Serial Terminal (115k2, N, 8, 1).

```
Gecko Bootloader v3.00.01
1. upload gbl
2. run
3. ebl info
BL > 
```

New firmware (gbl format) can be uploaded using XModem (115k2).
Enter the '1' key and transfer the new firmware via XModem.

There are also [third party applications](https://github.com/Elelabs/elelabs-zigbee-ezsp-utility) available to support flashing new firmware.
