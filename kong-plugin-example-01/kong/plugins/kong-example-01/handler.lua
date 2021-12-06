local BasePlugin = require "kong.plugins.base_plugin"

local KongExample01 = BasePlugin:extend()
KongExample01.PRIORITY = 500
KongExample01.VERSION = "1.0.0"

function KongExample01:new()
  KongExample01.super.new(self, "kong-example-01")
end


function KongExample01:access(config)
  print('KongExample-01:access')
  print('Name ', config.name)
  print('Number ', config.number)
  print('\n\n\n ')
end

return KongExample01
