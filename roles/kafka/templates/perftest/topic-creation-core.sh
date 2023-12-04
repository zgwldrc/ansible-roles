#!/bin/bash
# partitions
p=${1:-3}
# replicas
r=${2:-{{ansible_play_hosts|length}}}
# end id number
n=${3:-1}
bootstrap_servers={% for host in ansible_play_hosts %}{{hostvars[host]['ansible_default_ipv4']['address']}}:9092{% if not loop.last %},{% endif %}{% endfor +%}
# topic creation executable
ex="{{home}}/bin/kafka-topics.sh --bootstrap-server $bootstrap_servers --create"

for i in `seq 1 ${n}`;do
  $ex --topic test-$p-$r-$i --partitions $p --replication-factor $r
done