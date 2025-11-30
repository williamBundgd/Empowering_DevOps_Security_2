#!/bin/bash
curl https://git.devops.hkn/runner-started

docker login https://registry.devops.hkn -u docker_usr -p EPKjub1iziolDfl

docker run --detach \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --env=DRONE_RPC_PROTO=https \
  --env=DRONE_RPC_HOST=drone.devops.hkn \
  --env=DRONE_RPC_SECRET=whZfjQQpAyPISaIy5pm0axVsF9Z0oXeA \
  --env=DRONE_RUNNER_CAPACITY=1 \
  --env=DRONE_RUNNER_NAME=runner-1 \
  --env=DRONE_RUNNER_VOLUMES=/etc/ssl/certs/ca-certificates.crt:/etc/ssl/certs/ca-certificates.crt,/var/run/docker.sock:/var/run/docker.sock \
  --env=DRONE_DOCKER_CONFIG=/root/.docker/config.json \
  --env=DRONE_RUNNER_ENVIRON=FLAG:DDC\{1_4M_4_M4CH1N3_1_D0_WH4T_1_4M_T0LD\} \
  --volume /etc/ssl/certs/ca-certificates.crt:/etc/ssl/certs/ca-certificates.crt \
  --volume /root/.docker/config.json:/root/.docker/config.json \
  --restart=always \
  --name=runner \
  --oom-kill-disable \
  drone/drone-runner-docker:1

i=0
while true
do
        status=$(docker ps -q)
        if [ ! -z "${status}" ]; then
                curl https://git.devops.hkn/runner-running
        else
                curl https://git.devops.hkn/runner-down
        fi
        sleep 10
        i=$(($i + 1))

done
