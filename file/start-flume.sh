#!/bin/bash
JAVA_HOME=/usr/local/java/jdk1.8.0_152
PATH=$JAVA_HOME/bin:$PATH
export PATH
source /etc/profile
flumepath="/proj/server/apache-flume-1.7.0-bin"
cd $flumepath


conf=( 
channel_mutiplxing_sink.conf
sdk_multiplexing_sink.conf
commsdk_multiplexing_sink.conf
request_multiplexing_sink.conf
channel_put_multiplexing_sink.conf
xiaopeng_usercenter_sink.conf
xiaopeng_backend_sink.conf
xiaopeng_wap_sink.conf
xiaopeng_thirddata.conf
)

for i in  ${conf[@]};do
  conf_pid=`ps -elf |grep -v grep |grep -c $i`
    if [ $conf_pid == 0 ];then
     case $i in
xiaopeng_wap_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx512m -Xms512m -c . -f conf/xiaopeng_wap_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34545>>xiaopeng_wap_sink.conf.out &
;;

xiaopeng_backend_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/xiaopeng_backend_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34546>>xiaopeng_backend_sink.conf.out &
;;

request_multiplexing_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx512m -Xms512m -c . -f conf/request_multiplexing_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34547>>request_multiplexing_sink.conf.out &  
;;

channel_put_multiplexing_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx512m -Xms512m -c . -f conf/channel_put_multiplexing_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34548>>channel_put_multiplexing_sink.conf.out &  
;;

backend_multiplexing_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/backend_multiplexing_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34549>>backend_multiplexing_sink.conf.out &  
;;

vipbg_wap_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/vipbg_wap_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34550>>vipbg_wap_sink.conf.out &  
;;

vipbg_web_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/vipbg_web_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34551>>vipbg_web_sink.conf.out &  
;;

xiaopeng_usercenter_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/xiaopeng_usercenter_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34552>>xiaopeng_usercenter_sink.conf.out &  
;;

channel_mutiplxing_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/channel_mutiplxing_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34553>>channel_mutiplxing_sink.conf.out &  
;;

sdk_multiplexing_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx512m -Xms512m -c . -f conf/sdk_multiplexing_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34554>>sdk_multiplexing_sink.conf.out &  
;;

commsdk_multiplexing_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/commsdk_multiplexing_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34555>>commsdk_multiplexing_sink.conf.out &  
;;

sdk_common_multiplexing_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/sdk_common_multiplexing_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34556>>sdk_common_multiplexing_sink.conf.out &
;;

accountonline.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/accountonline.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34557>>accountonline.conf.out &
;;

app_install.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/app_install.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34558>>app_install.conf.out &
;;

game_inner.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/game_inner.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34559>>game_inner.conf.out &
;;

app_multiplexing_sink.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/app_multiplexing_sink.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34560>>app_multiplexing_sink.conf.out &
;;

xiaopeng_thirddata.conf)
nohup bin/flume-ng agent -n a1 -Xmx50m -Xms50m -c . -f conf/xiaopeng_thirddata.conf -Dflume.monitoring.type=http -Dflume.monitoring.port=34561>>xiaopeng_thirddata.conf.out &
;; 
esac
fi 
done

