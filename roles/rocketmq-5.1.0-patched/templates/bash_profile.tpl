# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

export ROCKETMQ_HOME={{ROCKETMQ_HOME}}
export JAVA_HOME={{JAVA_HOME}}
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${ROCKETMQ_HOME}/bin:${JAVA_HOME}/bin:$PATH

alias edprofile='vi ~/.bash_profile'
alias sysdr='sudo /usr/bin/systemctl daemon-reload'

# startup script
alias edrunbroker='vi {{ROCKETMQ_HOME}}/bin/runbroker.sh'
alias edrunserver='vi {{ROCKETMQ_HOME}}/bin/runserver.sh'

# broker
alias edbk='vi {{ROCKETMQ_HOME}}/conf/broker.conf'
alias edbkunit='vi /usr/lib/systemd/system/rmq_broker.service'
alias bkstart='sudo /usr/bin/systemctl start rmq_broker'
alias bkrestart='sudo /usr/bin/systemctl restart rmq_broker'
alias bkstop='sudo /usr/bin/systemctl stop rmq_broker'
alias bkstatus='sudo /usr/bin/systemctl status rmq_broker'
alias bklog='tail -n 200 -f {{ROCKETMQ_HOME}}/logs/rocketmqlogs/broker.log'

# namesrv
alias edns='vi {{ROCKETMQ_HOME}}/conf/namesrv.conf'
alias ednsunit='vi /usr/lib/systemd/system/rmq_namesrv.service'
alias nsstart='sudo /usr/bin/systemctl start rmq_namesrv'
alias nsstatus='sudo /usr/bin/systemctl status rmq_namesrv'
alias nsstop='sudo /usr/bin/systemctl stop rmq_namesrv'
alias nsrestart='sudo /usr/bin/systemctl restart rmq_namesrv'
alias nslog='journalctl -u rmq_namesrv'