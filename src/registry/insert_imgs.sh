# docker login https://registry.devops.hkn -u docker -p EPKjub1iziolDfl

docker pull python:buster
docker tag python:buster registry.devops.hkn/python:buster
# docker push registry.devops.hkn/python:buster
docker image rm python:buster
# docker image rm registry.devops.hkn/python:buster

docker pull docker:latest
docker tag docker:latest registry.devops.hkn/docker:1
# docker push registry.devops.hkn/docker:1
docker image rm docker:latest
# docker image rm registry.devops.hkn/docker:1

docker pull ubuntu:20.04
docker tag ubuntu:20.04 registry.devops.hkn/ubuntu:20.04
# docker push registry.devops.hkn/ubuntu:20.04
docker image rm ubuntu:20.04
# docker image rm registry.devops.hkn/ubuntu:20.04

# docker pull drone/git
# docker tag drone/git registry.devops.hkn/drone/git
# docker push registry.devops.hkn/drone/git

docker pull mysql:5.7
docker tag mysql:5.7 registry.devops.hkn/mysql:5.7
# docker push registry.devops.hkn/mysql:5.7
docker image rm mysql:5.7
# docker image rm registry.devops.hkn/mysql:5.7

docker pull postgres:13.2
docker tag postgres:13.2 registry.devops.hkn/postgres:13.2
# docker push registry.devops.hkn/postgres:13.2
docker image rm postgres:13.2
# docker image rm registry.devops.hkn/postgres:13.2

# docker logout https://registry.devops.hkn
