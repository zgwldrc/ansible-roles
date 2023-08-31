#!/bin/bash
# start
s=${1:-1}
# end
e=${2:-18}
# partitions
p=${3:-3}
# replicas
r=${4:-3}

bootstrap_servers={% for host in ansible_play_hosts %}{{hostvars[host]['ansible_default_ipv4']['address']}}:9092{% if not loop.last %},{% endif %}{% endfor +%}
# topic creation executable
ex="{{home}}/bin/kafka-topics.sh --bootstrap-server $bootstrap_servers --delete"

for i in `seq ${s} ${e}`;do
  $ex --topic test$i-$p-$r
done