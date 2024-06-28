#!/bin/bash
# https://www.elastic.co/guide/en/elasticsearch/reference/7.17/deb.html

scripts_dir=$(cd `dirname $0` && pwd)
role_dir=$(dirname $scripts_dir)
files_dir=$role_dir/files
mkdir -p $files_dir

PS3='请选择需下载的版本: '
versions=(7.17.22)
select version in "${versions[@]}"
do
    urls=(
        https://artifacts.elastic.co/downloads/kibana/kibana-${version}-linux-x86_64.tar.gz
    )
    for url in "${urls[@]}";do
        if [ ! -e "$files_dir/$(basename $url)" ]; then
            wget -P $files_dir $url
        else
            echo "$files_dir/$(basename $url) 文件已存在"
        fi
    done
    break
done








