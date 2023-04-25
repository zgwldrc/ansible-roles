#!/usr/bin/env bash

roles=$(find . -name tasks -type directory)
mkdir -p ~/.ansible
for role in ${roles[@]};do
  roledir=${role%/tasks}
  rolename=$(basename ${roledir})
  if [[ ! -z "$rolename" ]];then
    mkdir -p ~/.ansible/roles/$rolename
    rsync -av "${roledir}/" ~/.ansible/roles/$rolename > /dev/null
    echo "$rolename installed" 
  fi
done