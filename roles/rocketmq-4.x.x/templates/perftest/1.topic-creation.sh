#!/bin/bash

namesrv={{ lookup('template', 'templates/namesrv.j2')[:-1] }}

# create topic  test 
{{home}}/bin/mqadmin updateTopic -n 127.0.0.1:9876 -t test -c {{brokerClusterName}}

