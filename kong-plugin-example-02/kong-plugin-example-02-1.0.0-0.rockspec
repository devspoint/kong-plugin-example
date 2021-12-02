package = "kong-plugin-example-02"
version = "1.0.0-0"
source = {
   url = "git://github.com/cimarinho/kong-plugin-example-02",
   tag = "0.0.1"
}
description = {
   summary = "Exemplo de plugin Kong",
   homepage = "https://github.com/cimarinho/kong-plugin-example-02",
   license = "Apache 2.0"
}
dependencies = {
   "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.example-02.handler"] =       "kong/plugins/example-02/handler.lua",
      ["kong.plugins.example-02.schema"] =        "kong/plugins/example-02/schema.lua",
   }
}
