#!/bin/bash
ips=()
ip=

echo started
env
echo ""

for i in "$@"
do
	echo $i
	curl -v "http://"$i":55555/"
done
