# ASP.NET5 on Mac OS X and Docker
## Playground

- brew update

# General

- Sublime Text
- Kulture
- Omnisharp
- brew install docker
- Boot2Docker https://github.com/boot2docker
- Kitematic is a simple application for managing Docker containers on Mac OS X. (https://github.com/kitematic/kitematic)
- git clone https://github.com/davidfowl/HelloWorldVNext.git
- Dockerfile (https://github.com/aspnet/aspnet-docker)

# Docker

- brew install boot2docker (go,docker, boot2docker)
- boot2docker init (Creates/Provisions the Host VM)
- Open port on boot2docker host ```VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port5004,tcp,,5004,,5004";```
- boot2docker start (Powers on the VM and sets env variables for the docker client/cli - ip, certificates etc.) ($(boot2docker shellinit))
- docker (--tls) build -t aspnet ./aspnet
- docker build -t mvcapp .
- docker run --name="mvcapp" -i -p 5004:5004 -t mvcapp
- docker run --name="mvcapp" -p 5004:5004 -v /Users/nikolaia/Development/docker-aspnet5/src/mvcapp/src/:/app/ -t mvcapp
- docker rm mvcapp
- http://<boot2docker host ip>:5004


# Advanced:

Command: https://github.com/henriksen/kmon/
Gulp: https://github.com/tugberkugurlu/gulp-aspnet-k


http://nodemon.io/
https://github.com/timfpark/coreos-azure