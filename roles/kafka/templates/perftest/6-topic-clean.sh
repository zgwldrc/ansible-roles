#!/bin/bash
# how many topic group we will creating according to topic partitions in each topic group
# the pa array length will decided the number of topic groups
# the pa array value will decide the number of partitions of the topic group
pa=(3 6 9)

# max number of topics in each category topic group defined by variable pa
n=18

# topic replication factor in each topic group
r=3

for p in ${pa[@]};do
  ./topic-clean-core.sh 1 $n $p $r
done
