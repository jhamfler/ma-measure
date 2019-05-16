#!/bin/bash
set -m

ips=()
ip=

echo started
env
echo ""

if [ -z "$TIMES" ]
then
	TIMES=1000
fi

# call x times - load balancer handles the rest
for i in $(seq 1 $TIMES)
do
	curl "http://ue.default.svc.cluster.local:55555/" &
	pids[${i}]=$!
	sleep 0.001
done

# wait for every call to finish
for pid in ${pids[*]}
do
	echo waiting for $pid
	wait $pid
done

sleep 3
echo done
