#!/bin/bash
hp='{{ansible_default_ipv4.address}}:{{ports_http}}'
scheme='http'
CONSUL_HTTP_TOKEN="{{service_register_token.stdout}}"

# Register Service
 curl --silent -XPUT --data '{
  "ID": "test",
  "Name": "test",
  "Tags": ["test", "v1"],
  "Address": "127.0.0.1",
  "Port": 8000,
  "Meta": {
    "korea_version": "4.0"
  }
}' \
  --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
  $scheme://$hp/v1/agent/service/register | /usr/local/bin/jq

# List Services
 curl --silent \
  --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
  $scheme://$hp/v1/agent/services | /usr/local/bin/jq

# Deregister Service 
 curl --silent -XPUT \
  --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
  $scheme://$hp/v1/agent/service/deregister/test | /usr/local/bin/jq

# List Services
 curl --silent \
  --header "X-Consul-Token: $CONSUL_HTTP_TOKEN" \
  $scheme://$hp/v1/agent/services | /usr/local/bin/jq