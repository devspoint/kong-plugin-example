local BasePlugin = require "kong.plugins.base_plugin"

local KongExample03 = BasePlugin:extend()
KongExample03.PRIORITY = 500
KongExample03.VERSION = "1.0.0"

function KongExample03:new()
  KongExample03.super.new(self, "kong-example-03")
end


function KongExample03:access(config)
  print('KongExample-03:access')
  print('Name ', config.name)
  print('Number ', config.number)
end

return KongExample03
