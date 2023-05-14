## consul-server-one-policy.hcl
node_prefix "{{node_prefix}}" {
  policy = "write"
}