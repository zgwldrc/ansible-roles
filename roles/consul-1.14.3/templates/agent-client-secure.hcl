## agent-client-secure.hcl
server = false
datacenter = "{{DATACENTER}}"
domain = "{{DOMAIN}}" 

# Logging
log_level = "{{config.log_level}}"

retry_join = [ {% for item in config.retry_join %}"{{item}}"{% if not loop.last %},{% endif %}{% endfor %} ]

# Ports

ports {
  grpc_tls  = {{config.ports.grpc_tls}}
  http  = {{config.ports.http}}
  https = {{config.ports.https}}
  dns   = {{config.ports.dns}}
}

# Disable script checks
enable_script_checks = {{config.enable_script_checks|lower}}

# Enable local script checks
enable_local_script_checks = {{config.enable_local_script_checks|lower}}

# Data Persistence
data_dir = "{{config.data_dir}}"

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