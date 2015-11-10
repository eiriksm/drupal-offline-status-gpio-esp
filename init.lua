print "starting"
require "main"
require "config"
print "setting config"
config.gpio = gpio
config.net = net
config.wifi = wifi
config.node = node
config.crypto = crypto
print "initing"
main.init(config)
