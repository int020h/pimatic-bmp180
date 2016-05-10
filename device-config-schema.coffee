# #my-plugin configuration options
# Declare your config option for your plugin here. 
module.exports = {
  title: "pimatic-bmp180 config"
  BMP180Sensor: {
    title: "BMP180Sensor config options"
    type: "object"
    extensions: ["xLink"]
    properties: {
      device:
        description: "device file to use; default /dev/i2c-1"
        type: "string"
        default: "i2c-1"
      address:
        description: "address to use; default 0x77"
        type: "string"
        default: "0x77"
      interval:
        description: "interval in ms"
        type: "integer"
        default: "10000"
    }
  }
}
