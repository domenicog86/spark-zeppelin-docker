FROM mirkoprescha/spark-zeppelin

WORKDIR /work

ENTRYPOINT  /usr/local/spark/sbin/start-history-server.sh; $ZEPPELIN_HOME/bin/zeppelin-daemon.sh start  &&  tail -f /dev/null
