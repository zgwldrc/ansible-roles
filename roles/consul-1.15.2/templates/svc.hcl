service {
  name = "{{cli.service.name}}"
  id = "{{cli.service.id}}"
  tags = [{% for tag in cli.service.tags %}"{{tag}}"{% if not loop.last %},{% endif %}{% endfor %}]
  port = {{cli.service.port}}
  
  check {
    id =  "{{cli.service.check.id}}",
    name = "{{cli.service.check.name}}",
    service_id = "{{cli.service.check.service_id}}",
    tcp  = "{{cli.service.check.tcp}}",
    interval = "{{cli.service.check.interval}}",
    timeout = "{{cli.service.check.timeout}}"
  }
}