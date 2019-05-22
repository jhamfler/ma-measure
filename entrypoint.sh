#!/bin/bash
set -m

ips=()
ip=

echo started
env
echo ""

# introduced to give istio proxy time to connect to pilot
if [ -z "$DELAY" ]
then
	DELAY=10
fi
sleep $DELAY

if [ -z "$TIMES" ]
then
	TIMES=1000
fi

if [ -z "$PORT" ]
then
	PORT=4430
fi

# call x times - load balancer handles the rest
for i in $(seq 1 $TIMES)
do
	curl "http://ue.default.svc.cluster.local:4430/" &
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
