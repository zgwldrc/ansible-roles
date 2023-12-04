## Server specific configuration for ${DATACENTER}
server = {{server|lower}}
bootstrap_expect = {{ ansible_play_hosts|length }}
datacenter = "{{datacenter}}"
client_addr = "{{client_addr}}"
advertise_addr = "{{ansible_default_ipv4.address}}"
## UI configuration (1.9+)
ui_config {
  enabled = {{ui_enabled|lower}}
}