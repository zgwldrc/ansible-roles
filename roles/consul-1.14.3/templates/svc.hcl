service {
  name = "{{config.service.name}}"
  id = "{{config.service.id}}"
  tags = {{config.service.tags}}
  port = {{config.service.port}}
  
  check {
    id =  "{{config.service.check.id}}",
    name = "{{config.service.check.name}}",
    service_id = "{{config.service.check.service_id}}",
    tcp  = "{{config.service.check.tcp}}",
    interval = "{{config.service.check.interval}}",
    timeout = "{{config.service.check.timeout}}"
  }
}