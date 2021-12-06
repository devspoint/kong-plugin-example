local BasePlugin = require "kong.plugins.base_plugin"

local KongExample = BasePlugin:extend()
KongExample.PRIORITY = 500
KongExample.VERSION = "1.0.0"

function KongExample:new()
  KongExample.super.new(self, "kong-example")
end


function KongExample:access(config)
  print('KongExample:access')
  print('Name ', config.name)
  print('Number ', config.number)
end


return KongExample
