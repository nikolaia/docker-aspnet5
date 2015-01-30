# ASP.NET5 on Mac OS X and Docker
## Workshop

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
- Open port on boot2docker host ```VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port5000,tcp,,5000,,5000";```
- boot2docker start (Powers on the VM and sets env variables for the docker client/cli - ip, certificates etc.) ($(boot2docker shellinit))
- docker (--tls) build -t aspnet ./aspnet
- docker build -t helloworldapp .
- docker run -i -p 5000:5000 -t helloworldapp
- docker run -i -p 5000:5000 -v /Users/nikolaia/development/docker-aspnet5/helloworld/:/app/ -t helloworldapp
- http://<boot2docker host ip>:5000

# Grunt

How can we integrate grunt?

Run KPM restore inside of the container:
```grunt restore```

Build the aspnet5 project inside the container:
```grunt build```

Run grunt build when source files change:
```grunt watch```