#!/usr/bin/env bash
provider_cfg="{{conf_dir}}/{{cfg_subscribes[0].name}}-subscribe.yaml"
merged_cfg="{{conf_dir}}/{{cfg_subscribes[0].name}}-subscribe-merged.yaml"
local_cfg="{{conf_dir}}/config.yaml"
secret="{{secret}}"
timeout=10

count=0
while [ ! -e $provider_cfg ];do
  sleep 1
  ((count++))
  if ((count > timeout));then
    echo "Error: wating for provider_cfg timeout (10s), exiting"
    exit 1
  fi
done


yq ea 'select(fileIndex == 0) * select(fileIndex == 1)' "$provider_cfg" "$local_cfg" > "$merged_cfg"

if [[ ! -z "$secret" && -s "$merged_cfg" ]];then
  curl -s -XPUT "http://{{external_controller}}/configs" -H 'Authorization: Bearer {{secret}}' -d '{"path":"'$merged_cfg'"}'
else
  curl -s -XPUT "http://{{external_controller}}/configs" -d '{"path":"'$merged_cfg'"}'
fi