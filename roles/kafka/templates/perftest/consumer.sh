#!/bin/bash
export JAVA_HOME={{java_home}}

# partitions
p=${1:-3}
# replics
r=${2:-{{ansible_play_hosts|length}}}
# topic id number
id=${3:-1}
topic=test-$p-$r-$id
num_records=${4:-20000}
bootstrap_servers={% for host in ansible_play_hosts %}{{hostvars[host]['ansible_default_ipv4']['address']}}:9092{% if not loop.last %},{% endif %}{% endfor +%}

{% if app_version is version('3.0.0', '>') %}
{{home}}/bin/kafka-consumer-perf-test.sh --bootstrap-server $bootstrap_servers  --topic $topic --messages $num_records --reporting-interval 2000 --from-latest --timeout 10000000
{% else %}
{{home}}/bin/kafka-consumer-perf-test.sh --broker-list $bootstrap_servers  --topic $topic --messages $num_records --reporting-interval 2000 --from-latest --timeout 10000000
{% endif %}