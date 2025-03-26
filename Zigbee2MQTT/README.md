## Zigbee2MQTT and the XIAO MG24

* Zigbee NCP for use with Zigbee2MQTT

* Config file setup (configuration.yaml)

* External Converters


##### Step 1.

Flash the Zigbee NCP firmware to the XIAO MG24.
See this [link](https://github.com/grobasoz/xiao_mg24/blob/main/firmware/ZIGBEE_NCP/Readme.md).

Note the serial port assigned to the XIAO MG24 NCP device.

##### Step 2.

Install Zigbee2MQTT from the [git repository](https://github.com/Koenkk/zigbee2mqtt.git).

```git clone https://github.com/Koenkk/zigbee2mqtt.git
cd zigbee2mqtt
npm install
```

##### Step 3.

Edit the *configuration.yaml* file.

```cd data
copy configuration.example.yaml configuration.yaml
*edit* configuration.yaml (i.e. with your usual editor)
```

Add the following basic settings.
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
