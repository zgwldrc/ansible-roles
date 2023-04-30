# agent-server-secure.hcl

# Data Persistence
data_dir = "{{config.data_dir}}"
disable_keyring_file = {{disable_keyring_file|lower}}
# Logging
log_level = "{{config.log_level}}"

# Enable service mesh
connect {
  enabled = {{config.connect.enabled|lower}}
}

# Addresses and ports
addresses {
  grpc = "{{config.addresses.grpc}}"
  https = "{{config.addresses.https}}"
  dns = "{{config.addresses.dns}}"
}

ports {
  grpc_tls  = {{config.ports.grpc_tls}}
  http  = {{config.ports.http}}
  https = {{config.ports.https}}
  dns   = {{config.ports.dns}}
}

# DNS recursors
recursors = [{% for recursor in config.recursors %}"{{recursor}}"{% if not loop.last %},{% endif %}{% endfor %}]

# Disable script checks
enable_script_checks = {{config.enable_script_checks|lower}}

# Enable local script checks
enable_local_script_checks = {{config.enable_local_script_checks|lower}}