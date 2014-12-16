# workshop: aspnet5 on docker

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

- boot2docker start
- docker build -t aspnet ./aspnet
- docker build -t helloworldapp .
- docker run -i -p 5000:5000 -t aspnet
- docker run -i -p 5000:5000 -v /Users/nikolaia/development/docker-aspnet5/helloworld/:/app/ -t aspnet
- http://192.168.59.103:5000

# Grunt

How can we integrate grunt?

Run KPM restore inside of the container:
```grunt restore```

Build the aspnet5 project inside the container:
```grunt build```

Run grunt build when source files change:
```grunt watch```