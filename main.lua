module("main", package.seeall)

function init(config)
  local gp = config.greenPin
  local rp = config.redPin
  local gpio = config.gpio
  local wifi = config.wifi
  local node = config.node
  local crypto = config.crypto
  local hash = ''
  -- Set to connect to something else.
  wifi.setmode(wifi.STATION)
  wifi.sta.config(config.ssid, config.pass)
  function repeater()
      sk = net.createConnection(net.TCP, 0)
      str = nil
      sk:on("receive", function(sck, c)
        -- Only save the first round.
        if str then return end
        if not c then return end
        str = c
        sck:close()
      end )
      sk:connect(80, config.host)
      sk:on("connection", function(sck,c)
        sk:send("GET " .. config.path .. "?cache_bust=" .. tmr.time() .. hash .. " HTTP/1.1\r\nHost: " .. config.host .. "\r\nConnection: keep-alive\r\nAccept: */*\r\n\r\n")
      end )
      sk:on("disconnection", function(sck)
        if str then
            code = string.sub(str, 10, 12)
            hash = crypto.toHex(crypto.hash("sha1", str))
            print("code is " .. code .. " is code")
            if code == "200" or code == 200 then
                gpio.write(rp, gpio.LOW)
                gpio.write(gp, gpio.HIGH)
            else
                gpio.write(rp, gpio.HIGH)
                gpio.write(gp, gpio.LOW)
            end
        end
        tmr.alarm(1, 1000, 1, repeater)
      end )
  end
  print("Starting poll")
  repeater()
end
