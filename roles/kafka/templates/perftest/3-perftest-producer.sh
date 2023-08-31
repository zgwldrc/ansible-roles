export JAVA_HOME={{java_home}}

# start num id
s=${1:-1}
# end num id
e=${2:-3}
# partition id
p=${3:-3}
# replicas factor id
r=${4:-3}
# through_put
through_put=${5:-1000}
# total_messages
total_messages=${6:-20000}

for i in `seq $s $e`;do 
  if [[ $i -eq $e ]];then
    ./producer.sh $i $p $r $through_put $total_messages | tee /tmp/producer-$i.log
  else
    nohup ./producer.sh $i $p $r $through_put $total_messages &> /tmp/producer-$i.log < /dev/null &
  fi
done