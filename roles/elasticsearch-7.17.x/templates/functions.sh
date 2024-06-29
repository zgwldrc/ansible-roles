# ELASTIC_PASSWORD


function get-indices(){
    local queryStr=""
    local opts=""
    if [[ ! -z "$ELASTIC_PASSWORD" ]];then
        opts="-u elastic:$ELASTIC_PASSWORD"
    fi

    if [[ $# -gt 0 ]];then
        for param in "$@"; do
            if [[ -z "$queryStr" ]]; then
                queryStr="$param"
            else
                queryStr="$queryStr&$param"
            fi
        done
        queryStr="?$queryStr"
    fi

    curl $opts -X GET "localhost:9200/_cat/indices$queryStr"
}

function get-index-settings(){
    local indexName=$1
    local opts=""
    if [[ ! -z "$ELASTIC_PASSWORD" ]];then
        opts="-u elastic:$ELASTIC_PASSWORD"
    fi
    curl $opts -X GET "localhost:9200/$indexName/_settings"
}

function create-index-template-with-replicas(){
    set -o noglob
    local all_params=("$@")  # 将所有参数存储到数组中
    local total_params=${#all_params[@]}  # 获取参数总数

    local opts=""
    if [[ ! -z "$ELASTIC_PASSWORD" ]];then
        opts="-u elastic:$ELASTIC_PASSWORD"
    fi
    if (( total_params < 4 )); then
        echo "Usage: create-index-template-with-replicas <template_name> <number_of_shards> <number_of_replicas> <index-patterns...>"
        return 1
    else
        # 取前三个参数存入不同变量
        local template_name="$1"
        local number_of_shards="$2"
        local number_of_replicas="$3"
        # 取剩下的参数，并用双引号括起来，再用逗号拼接
        local other_params="${@:4}"
        local other_params_quoted=$(printf '"%s", ' ${other_params[@]})
        other_params_quoted="${other_params_quoted%, }"  # 移除最后一个逗号
    fi
    curl $opts -X PUT "http://localhost:9200/_template/$template_name" \
      -H 'Content-Type: application/json' -d'
        {
            "index_patterns": ['$other_params_quoted'],
            "settings": {
                "number_of_shards": '$number_of_shards',
                "number_of_replicas": '$number_of_replicas'
            }
        }
    '
    set +o noglob
}

function get-index-template() {
    local all_params=("$@")  # 将所有参数存储到数组中
    local total_params=${#all_params[@]}  # 获取参数总数
    local opts=""
    if [[ ! -z "$ELASTIC_PASSWORD" ]];then
        opts="-u elastic:$ELASTIC_PASSWORD"
    fi
    
    if ((total_params < 1)); then
        curl $opts  -X GET "http://localhost:9200/_template"
    else
        for index_template in "${all_params[@]}";do
            curl $opts  -X GET "http://localhost:9200/_template/$index_template"
        done
    fi
}