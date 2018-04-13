#/bin/bash
DIR=/proj/server/filebeat
PID=`ps -elf | grep -v grep | grep filebeat| awk '{print $4}'`

case $1 in
start)
  echo "stating filebeat..."
  ${DIR}/filebeat -c ${DIR}/filebeat.yml  &
  sleep 3
  tail ${DIR}/logs/filebeat
;;
stop)
  echo "stoped filebeat..."
  kill -9 ${PID}
;;
restart)
  echo "stoped filebeat..."
  kill -9 ${PID}
  echo "starting filebeat..."
  ${DIR}/filebeat -c ${DIR}/filebeat.yml  &
  sleep 3
  tail ${DIR}/logs/filebeat
;;
*)
  echo "Usage:$0 {start|stop|restart}"
;;
esac
