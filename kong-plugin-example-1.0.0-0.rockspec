package = "kong-plugin-example"
version = "1.0.0-0"
source = {
   url = "git://github.com/cimarinho/kong-plugin-example",
   tag = "0.0.1"
}
description = {
   summary = "Exemplo de plugin Kong",
   homepage = "https://github.com/cimarinho/kong-plugin-example",
   license = "Apache 2.0"
}
dependencies = {
   "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.kong.plugins.example.handler"] =       "kong/plugins/example/handler.lua",
      ["kong.plugins.kong.plugins.example.schema"] =        "kong/plugins/example/schema.lua",
   }
}
