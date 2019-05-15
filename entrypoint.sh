#!/bin/bash
set -m

ips=()
ip=

echo started
env
echo ""

if [ -z "$TIMES" ]
then
	TIMES=10000
fi

# call 100 times - load balancer handles the rest
for i in {1..$TIMES}
do
	curl -v "http://ue.default.svc.cluster.local:55555/" &
	sleep 0.001
done

wait
echo done
