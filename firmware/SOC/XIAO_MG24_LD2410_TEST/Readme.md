## Example hardware - Microwave Occupancy Sensor

Pair a [XIAO MG24](https://www.seeedstudio.com/Seeed-Studio-XIAO-MG24-p-6247.html) with a [24GHz mmWave for XIAO](https://www.seeedstudio.com/Seeed-Studio-XIAO-24Ghz-mmwave-Human-Static-Presence-Module-p-6266.html).

![MG24_MMWAVE](../../../assets/XIAO_MG24_MMWAVE.png)

### XIAO MG24 LD2410 Microwave Sensor Test.

NB: Make sure only one USB based XIAO MG24 is connected

**Flash the bootloader - from the OpenOCD folder**
```flash_code ..\firmware\SOC\Bootloaders\XIAO_MG24_BTL_INT_1K5.hex```

(Should take less than 1 second)

**Flash the main application**
```flash_code ..\firmware\SOC\XIAO_MG24_LD2410_TEST\XIAO_MG24_LD2410_TEST.hex```

(Should take about 10 seconds with verify)

If you have a serial port monitor connected to your XIAO MG24 you should see the following...

```c
Reset info: 0x06 ( SW)
SL_STATUS_NETWORK_UP 0x4043
NWK Steering stack status 0x15
Extended Reset info: 0x0600 (UNK)
LD2410 Init
LD2410 Starting
XIAO_MG24_LD2410> 

```
