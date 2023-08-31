export JAVA_HOME={{java_home}}
# start num id
s=${1:-1}
# end num id
e=${2:-3}
# partition id
p=${3:-3}
# replicas factor id
r=${4:-3}
# total_messages
total_messages=${5:-20000}


for i in `seq $s $e`;do
  if [[ $i -eq $e ]];then
    ./consumer.sh $i $p $r $total_messages | tee /tmp/consumer-$i.log
  else
    nohup ./consumer.sh $i $p $r $total_messages &> /tmp/consumer-$i.log < /dev/null &
  fi
done