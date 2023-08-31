#!/bin/bash

bootstrap_servers={% for host in ansible_play_hosts %}{{hostvars[host]['ansible_default_ipv4']['address']}}:9092{% if not loop.last %},{% endif %}{% endfor +%}
{{home}}/bin/kafka-consumer-groups.sh --bootstrap-server $bootstrap_servers --delete --all-groups