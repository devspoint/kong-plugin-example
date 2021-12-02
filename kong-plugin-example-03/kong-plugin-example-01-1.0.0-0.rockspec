package = "kong-plugin-example-03"
version = "1.0.0-0"
source = {
   url = "git://github.com/cimarinho/kong-plugin-example-03",
   tag = "0.0.1"
}
description = {
   summary = "Exemplo de plugin Kong",
   homepage = "https://github.com/cimarinho/kong-plugin-example-03",
   license = "Apache 2.0"
}
dependencies = {
   "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.example-03.handler"] =       "kong/plugins/example-03/handler.lua",
      ["kong.plugins.example-03.schema"] =        "kong/plugins/example-03/schema.lua",
   }
}
