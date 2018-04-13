#! /bin/sh

#[[ $EUID -eq 0 ]] && echo 'Error: This script must be run as not root!' && exit 1


prefix=/proj/server/nginx_http2
pid=/proj/logs/nginx80/nginx.pid

case "$1" in
    start)
	if [ ! -f "${pid}" ] ;then 
            echo  "starting nginx"
            ${prefix}/sbin/nginx -c ${prefix}/conf/nginx.conf
	else
	    echo  "started nginx" 
	fi
        ;;
    stop)
	if [ -f "${pid}" ] ;then 
            echo  "stoping nginx"
            ${prefix}/sbin/nginx -c ${prefix}/conf/nginx.conf -s stop
	else
            echo  "stoped nginx"
	fi
        ;;
    restart)
	$0 stop
	   sleep 3
	$0 start
	;;
    reload)
        echo  "reloading nginx"
        ${prefix}/sbin/nginx -c ${prefix}/conf/nginx.conf -s reload
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|reload}"
        ;;
esac


