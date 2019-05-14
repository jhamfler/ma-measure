#!/bin/bash
ips=()
ip=

echo started
env
echo ""

# call 100 times - load balancer handles the rest
for i in $(seq 1 100)
do
	curl -v "http://ue.default.svc.cluster.local:55555/"
done
