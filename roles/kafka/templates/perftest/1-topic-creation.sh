#!/bin/bash
# how many topic group we will creating according to topic partitions in each topic group
# the pa array length will decided the number of topic groups
# the pa array value will decide the number of partitions of the topic group
pa=(3 6 9)

# max number of topics in each category topic group defined by variable pa
n=3

# topic replication factor in each topic group
r={{ansible_play_hosts|length}}

for p in ${pa[@]};do
  ./topic-creation-core.sh $p $r $n
done
