## dns-request-policy.hcl
node_prefix "" {
  policy = "read"
}
service_prefix "" {
  policy = "read"
}
# Required if you use prepared queries
query_prefix "" {
  policy = "read"
}