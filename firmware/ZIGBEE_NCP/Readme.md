## Zigbee NCP for the XIAO_MG24

#### Use with Zigbee2MQTT 


In **configuration.yaml** set the following...
```python
serial:
  port: COMxx
  adapter: ember
  rtscts: false
  baud: 115200
```

#### Notes:

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
