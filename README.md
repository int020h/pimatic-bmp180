pimatic-bmp180
=======================

Add support for the BMP180 barometric pressure sensor to pimatic.
This plugin will show you the pressure (QNH) in hectopascal (HPa) and temperature (T) in degrees Celsius (°C).

Wiring schema
=======================
![wiring schema](https://github.com/int020h/pimatic-bmp180/blob/master/RPi%20%2B%20BMP180.png)

raspberry pi pin | wire colour | BMP180 sensor pin
-----------------|-------------|------------------
1 (3V3)*         | red         | VIN
9 (GND)          | black       | GND
3 (SDA1 I2C)     | yellow      | SDA
5 (SCL1 I2C)     | blue        | SCL

*Note that the BMP180 sensor requires 3.3V and will fry at 5V!
Picture above shows the GY-68 module featuring the BMP180 sensor.

Raspberry pi setup
=======================
The BMP180 sensor uses I2C for communication, so you'll have to enable this on your raspberry pi, using raspi-config:

```
sudo raspi-config
```

Select **9 Advanced Options** and then **A6 I2C** to enable the ARM I2C interface and load any kernel module you need at boot.

Pimatic configuration
========================
Add the following to your **plugins** section:
```
  "plugins": [
    {
      "plugin": "bmp180"
    },
    {... any other plugins you have configured ...}
  ],
```
And this to your **devices** section:
```
  "devices": [
    {
      "id": "pressure-sensor",
      "name": "BMP180 sensor",
      "class": "BMP180Sensor",
      "device": "/dev/i2c-1",
      "address": "0x77",
      "interval": 60000
    },
    {... any other devices you have configured ...}
```
Of course you may need to adjust the device, address and interval parameters. The interval parameter is the sensor poll interval in ms.
