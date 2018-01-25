# Purpose 

This docker image provides a local *spark* installation with *zeppelin* and a running *spark-history-server*.
It is uploaded in [dockerhub](https://hub.docker.com/r/mirkoprescha/spark-zeppelin-docker/) in a public repository.

I use it to evaluate independently spark code in a more convenient way then a spark-shell.
 
## Components
- spark version="2.1.0"
- zeppelin version="0.7.2"
- hadoop version="2.7"
 
## Start the container
```
  docker run -d  -p 18080:18080 -p 8088:8080 domenicog86/spark-zeppelin-docker -name spark-zeppelin-docker
```

For other documentation see original code in https://hub.docker.com/r/mirkoprescha/spark-zeppelin/
