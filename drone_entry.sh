#!/bin/bash

set -x

WORKER_DNS=${WORKER_DNS:-}
WORKERS=${WORKERS:-2}

if [ ! -z ${WORKER_DNS} ]; then
  workers=
  while [ -z ${workers} ]; do
    echo "Checking for ${WORKER_DNS} entries..."
    for ip in $(dig ${WORKER_DNS}|grep ^${WORKER_DNS}\. |awk '{print $5}'); do
        for i in $(seq 1 ${WORKERS});do
            workers=${workers}tcp://$ip:2375,
        done
    done
    workers=$(echo $workers|sed "s/,$//")
    export DRONE_WORKER_NODES=$workers
  done
fi


exec /usr/local/bin/droned

