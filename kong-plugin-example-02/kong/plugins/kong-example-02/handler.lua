local BasePlugin = require "kong.plugins.base_plugin"

local KongExample02 = BasePlugin:extend()
KongExample02.PRIORITY = 500
KongExample02.VERSION = "1.0.0"

function KongExample02:new()
  KongExample02.super.new(self, "kong-example-01")
end


function KongExample02:access(config)
  print('KongExample-02:access')
  print('Name ', config.name)
  print('Number ', config.number)
end

return KongExample02
