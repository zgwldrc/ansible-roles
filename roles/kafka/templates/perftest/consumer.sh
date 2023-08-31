#!/bin/bash
export JAVA_HOME={{java_home}}
id=${1:-1}
# partitions
p=${2:-3}
# replics
r=${3:-3}
topic=test$id-$p-$r
num_records=${4:-20000}
bootstrap_servers={% for host in ansible_play_hosts %}{{hostvars[host]['ansible_default_ipv4']['address']}}:9092{% if not loop.last %},{% endif %}{% endfor +%}

{{home}}/bin/kafka-consumer-perf-test.sh --bootstrap-server $bootstrap_servers  --topic $topic --messages $num_records --reporting-interval 2000 --from-latest --timeout 10000000