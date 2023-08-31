#!/bin/bash


filelist=(
1-topic-creation.sh
2-perftest-consumer.sh
3-perftest-producer.sh
4-stop-perftest.sh
5-consumer-clean.sh
6-topic-clean.sh
7-clean-files.sh
consumer.sh
producer.sh
topic-clean-core.sh
topic-creation-core.sh
)

rm -f ${filelist[@]}