# #my-plugin configuration options
# Declare your config option for your plugin here. 
module.exports = {
  title: "pimatic-bmp180 config"
  type: "object"
  properties: {
      debug:
        description: "debug mode"
        type: "boolean"
        default: false
  }
}
