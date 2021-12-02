local BasePlugin = require "kong.plugins.base_plugin"

local KongExample = BasePlugin:extend()
KongExample.PRIORITY = 500
KongExample.VERSION = "1.0.0"

function KongExample:new()
  KongExample.super.new(self, "kong-example")
end

function KongExample:init_worker(config)
  --print('KongExample:init_worker\n\n\n\n')
end

function KongExample:rewrite(config)
  --print('KongExample:rewrite\n\n\n\n')
end

function KongExample:header_filter(config)
  --print('KongExample:header_filter')
end

function KongExample:access(config)
  print('KongExample:access')
  print('Name ', config.name)
  print('Number ', config.number)
end

function KongExample:body_filter(config)
  --print('KongExample:body_filter')
  --local chunk, eof = ngx.arg[1], ngx.arg[2]
  --print('chunk=',chunk)
  --print('eof=',eof)
  --print('\n\n\n')

end
function KongExample:log(config)
  --print('KongExample:log')
end
return KongExample
