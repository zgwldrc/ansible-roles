## Server specific configuration for ${DATACENTER}
server = {{config.server|lower}}
bootstrap_expect = {{config.bootstrap_expect}}
datacenter = "{{config.datacenter}}"

client_addr = "{{config.client_addr}}"

## UI configuration (1.9+)
ui_config {
  enabled = {{config.ui_config.enabled|lower}}
}