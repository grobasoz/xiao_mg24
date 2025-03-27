## Zigbee2MQTT and the XIAO MG24

### We need to...

* Create Zigbee NCP for use with Zigbee2MQTT

* Config file setup (configuration.yaml)

* Add External Converters (for our devices)


##### Step 1.

Flash the Zigbee NCP firmware to the XIAO MG24
See this [link](https://github.com/grobasoz/xiao_mg24/blob/main/firmware/ZIGBEE_NCP/Readme.md)

Note the serial port assigned to the XIAO MG24 NCP device

##### Step 2.

[Install Zigbee2MQTT](https://www.zigbee2mqtt.io/guide/installation/05_windows.html) and setup accordingly. 
*NB. Install an MQTT broker if you don't have one already*


##### Step 3.

Edit the *configuration.yaml* file.

```cd data
copy configuration.example.yaml configuration.yaml
edit configuration.yaml (i.e. with your usual editor)
```

Add the following basic settings (modifying where necessary).
``` mqtt:
  base_topic: zigbee2mqtt
  server: mqtt://127.0.0.1:1883
  user: *username*
  password: *password*
serial:
  port: *COMxx*
  adapter: ember
  rtscts: false
  baud: 115200
```

### External Converters
