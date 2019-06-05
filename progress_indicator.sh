#! /bin/sh

show_progress() {
	# $! show the background process PID
	pid=`echo $!`
	#echo "pid=$pid"
	#ls -l /proc/$pid

	str="| / - \\"
	count=1

	# when the procrss has done, the /proc/PID folder will be gone
	while [ -d /proc/$pid ]; do
		if [ $count == 5 ]; then
			count=1
		fi
		echo -e -n "\r"`echo $str | awk '{print $'$count'}'`
		count=`expr $count + 1`
		sleep 1
	done
}

do_main() {
	# do some commands that take time and run it in a background process (ex: untar)
	# tar --directory=$TOOL_ROOT -zxf $TOOL_NANE.tar.gz&
	sleep 10 &
	show_progress
}

do_main
