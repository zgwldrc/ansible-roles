esaddr={{esaddr}}
port={{esport}}
curl -s --connect-timeout 10 -o /dev/null  http://${esaddr}:${port}/_cat/nodes >/dev/null 2>&1 
if [ "$?" != "0" ];then
    echo "Elasticserach 访问失败, 请安装完后检查并重新执行该脚本 "
    exit
fi

templates=(
    ks_kafka_broker_metric
    ks_kafka_cluster_metric
    ks_kafka_connect_cluster_metric
    ks_kafka_connect_connector_metric
    ks_kafka_connect_mirror_maker_metric
    ks_kafka_group_metric
    ks_kafka_partition_metric
    ks_kafka_topic_metric
    ks_kafka_zookeeper_metric
)

for template in ${templates[@]};do
curl -s --connect-timeout 10 -X POST \
 -H 'cache-control: no-cache' \
 -H 'content-type: application/json' \
 http://${esaddr}:${port}/_template/$template -d @$template
done

for i in {0..6};
do
    logdate=_$(date -d "${i} day ago" +%Y-%m-%d)
    for template in ${templates[@]};do
        curl -s --connect-timeout 10  -X PUT \
        -H 'cache-control: no-cache' \
        -H 'content-type: application/json' \
        http://${esaddr}:${port}/${template}${logdate}
    done
done