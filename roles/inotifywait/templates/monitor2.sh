## tail last line of monitored file in fix frequency
file_path="{{file_path2}}"
log_file="{{log_file2}}"

while true
do
    # 获取当前时间
    current_time=$(date +"%Y-%m-%d %H:%M:%S")
    # 获取目标文件最后一行
    lastline=$(tail -n 1 $file_path)
    printf "%s - %s\n" "$current_time" "$lastline" >> $log_file
    sleep 10
done
