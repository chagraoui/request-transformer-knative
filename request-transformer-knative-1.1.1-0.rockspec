package = "kong-plugins-request-transformer"

version = "1.1.1-0"

source = {
  url = "git+https://github.com/chagraoui/request-transformer-knative",
}

local pluginName = "request-transformer-knative"
supported_platforms = {"linux", "macosx"}


description = {
  summary = "A Kong plugin request-transformer"
}
dependencies = {
  "lua ~> 5"
}
build = {
  type = "builtin",
  modules = {
    ["kong.plugins.request-transformer.migrations.cassandra"] = "migrations/cassandra.lua",
    ["kong.plugins.request-transformer.migrations.postgres"] = "migrations/postgres.lua",
    ["kong.plugins.request-transformer.migrations.common"] = "migrations/common.lua",
    ["kong.plugins.request-transformer.handler"] = "handler.lua",
    ["kong.plugins.request-transformer.access"] = "access.lua",
    ["kong.plugins.request-transformer.schema"] = "schema.lua",
  }
}
