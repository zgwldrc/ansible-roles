# agent-server-secure.hcl
retry_join = [{%- for host in (ansible_play_hosts | sort()) -%}"{{hostvars[host]['ansible_default_ipv4']['address']}}"{% if not loop.last %},{% endif %}{%- endfor +%}]
# Data Persistence
data_dir = "{{data_dir}}"
disable_keyring_file = {{disable_keyring_file|lower}}

# Enable service mesh
connect {
  enabled = {{connect_enabled|lower}}
}

# Addresses and ports
addresses {
  grpc = "{{addresses_grpc}}"
  http = "{{addresses_http}}"
  https = "{{addresses_https}}"
  dns = "{{addresses_dns}}"
}

ports {
  grpc_tls  = {{ports_grpc_tls}}
  http  = {{ports_http}}
  https = {{ports_https}}
  dns   = {{ports_dns}}
}

# DNS recursors
recursors = [{% for recursor in recursors %}"{{recursor}}"{% if not loop.last %},{% endif %}{% endfor %}]

# Disable script checks
enable_script_checks = {{enable_script_checks|lower}}

# Enable local script checks
enable_local_script_checks = {{enable_local_script_checks|lower}}