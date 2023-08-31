#!/bin/bash

# 监测的目标文件
file_path="{{file_path}}"

# 日志文件路径
log_file="{{log_file}}"

# 监测文件写入事件并记录时间点到日志文件
inotifywait -m -e modify "$file_path" |
while read -r filename events; do
    # 获取当前时间
    current_time=$(date +"%Y-%m-%d %H:%M:%S")
    # 将时间点记录到日志文件
    echo "File $filename was written at $current_time" >> "$log_file"
done
