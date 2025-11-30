docker pull python:buster
docker tag python:buster registry.devops.hkn/python:buster
docker image rm python:buster

docker pull docker:latest
docker tag docker:latest registry.devops.hkn/docker:1
docker image rm docker:latest

docker pull ubuntu:20.04
docker tag ubuntu:20.04 registry.devops.hkn/ubuntu:20.04
docker image rm ubuntu:20.04

docker pull drone/git

docker pull drone/drone-runner-docker:1

docker pull mysql:5.7
docker tag mysql:5.7 registry.devops.hkn/mysql:5.7
docker image rm mysql:5.7

docker pull postgres:13.2
docker tag postgres:13.2 registry.devops.hkn/postgres:13.2
docker image rm postgres:13.2

cat /mnt/config/edsCA.pem >> /etc/ssl/certs/ca-certificates.crt
poweroff
