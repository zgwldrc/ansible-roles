## agent-client-secure.hcl
server = false
datacenter = "{{DATACENTER}}"
domain = "{{DOMAIN}}" 
disable_keyring_file = {{disable_keyring_file|lower}}
# Logging
log_level = "{{log_level}}"

retry_join = [ {% for item in retry_join %}"{{item}}"{% if not loop.last %},{% endif %}{% endfor %} ]

# Ports

ports {
  grpc_tls  = {{ports_grpc_tls}}
  http  = {{ports_http}}
  https = {{ports_https}}
  dns   = {{ports_dns}}
}

# Disable script checks
enable_script_checks = {{enable_script_checks|lower}}

# Enable local script checks
enable_local_script_checks = {{enable_local_script_checks|lower}}

# Data Persistence
data_dir = "{{data_dir}}"

## TLS Encryption (requires cert files to be present on the server nodes)
tls {
  defaults {
    ca_file   = "{{CONSUL_CONFIG_DIR}}/consul-agent-ca.pem"
    verify_outgoing        = true
    verify_incoming        = true
  }
  https {
    verify_incoming        = false
  }
  internal_rpc {
    verify_server_hostname = true
  }
}

auto_encrypt {
  tls = true
}

acl {
  enabled        = true
  default_policy = "deny"
  enable_token_persistence = true
}