#########################################################################
# File Name: php/status.sh
# Author: kerncai
# mail: kernkerncai@gmail.com
# Created Time: 2013年11月13日 星期三 14时02分35秒
#########################################################################
#!/bin/bash
HOST='localhost'
idle(){
        wget --quiet -O - http://$HOST/php/status?auto |grep "idle processes" |awk '{print$3}'
}

total(){
        wget --quiet -O - http://$HOST/php/status?auto |grep "total processes" |awk '{print$3}'
}

active(){
        wget --quiet -O - http://$HOST/php/status?auto |grep "active" |awk '{print$3}'|grep -v "process"
}

mactive(){

        wget --quiet -O - http://$HOST/php/status?auto |grep "max active processes:" |awk '{print$4}'
}

listenqueuelen(){
        wget --quiet -O - http://$HOST/php/status?auto |grep "listen queue len" |awk '{print$4}'
}

listenqueue(){
        wget --quiet -O - http://$HOST/php/status?auto |grep "listen queue:"|grep -vE "len|max"|awk '{print$3}'
}

since(){
        wget --quiet -O - http://$HOST/php/status?auto |grep "start since: " |awk '{print$3}'
}

conn(){
        wget --quiet -O - http://$HOST/php/status?auto |grep "accepted conn" |awk '{print$3}'
}
$1

