#!/bin/bash
export JAVA_HOME={{java_home}}
id=${1:-1}
# partitions
p=${2:-3}
# replics
r=${3:-3}
topic=test$id-$p-$r
throughput=${4:-1000}
acks=-1
record_size=1024
num_records=${5:-20000}
bootstrap_servers={% for host in ansible_play_hosts %}{{hostvars[host]['ansible_default_ipv4']['address']}}:9092{% if not loop.last %},{% endif %}{% endfor +%}

{{home}}/bin/kafka-producer-perf-test.sh \
  --topic $topic \
  --num-records $num_records \
  --record-size $record_size \
  --producer-props bootstrap.servers=$bootstrap_servers acks=$acks \
  --throughput $throughput