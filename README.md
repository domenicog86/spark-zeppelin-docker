# Purpose 

This docker image provides a local *spark* installation with *zeppelin* and a running *spark-history-server*.
It is uploaded in [dockerhub](https://hub.docker.com/r/mirkoprescha/spark-zeppelin/) in a public repository.

I use it to evaluate independently spark code in a more convenient way then a spark-shell.
 
## Components
- spark version="2.1.0"
- zeppelin version="0.7.1"
- hadoop version="2.7"
 
## Start the container
```
  docker run -it -p 18080:18080 -p 8088:8080   mirkoprescha/spark-zeppelin
```

## Open Zeppelin and Spark History Server  

In your local browser 
- Zeppelin: http://localhost:8088/#/
- Spark History Server: http://localhost:18080/?showIncomplete=true

Probably, you have to wait roughly 10 second until zeppelin daemon has been started, right after starting the container.



## Spark-App
 
### Copy your spark jar to docker container

Start another shell session and copy the jar-file into the docker container.
Following command copies it into your latest started container.
```
docker cp <your-jar-file.jar> $(docker ps  -l -q):/work/
```


###  Run spark job

Go back to container session. You should be connected as root in the docker container:

```
cd /work
spark-submit   --class <your-class-name-with-package> \
      <your-jar-file.jar> \
      [<your-program-parameters>]
```
 

## Changes in dockerfile
 
After changes in `Dockerfile` goto project home dir and run
```
docker build  -t mirkoprescha/spark-zeppelin .
```

Push to docker hub
```
docker push  mirkoprescha/spark-zeppelin
```


## Misc

### if container session is lost
```
docker start CONTAINER_ID
docker attach CONTAINER_ID
```

### run as background session
add `- d`