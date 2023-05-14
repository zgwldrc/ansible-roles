## TLS Encryption (requires cert files to be present on the server nodes)
tls {
  defaults {
    ca_file   = "{{CONSUL_CONFIG_DIR}}/consul-agent-ca.pem"
    cert_file = "{{CONSUL_CONFIG_DIR}}/{{DATACENTER}}-server-{{DOMAIN}}-0.pem"
    key_file  = "{{CONSUL_CONFIG_DIR}}/{{DATACENTER}}-server-{{DOMAIN}}-0-key.pem"
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
  allow_tls = true
}