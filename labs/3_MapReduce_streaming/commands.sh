#!/bin/bash

source ../2_*/env.sh

hdfs dfs -mkdir /user/$USER/wordcount
hdfs dfs -rm -r -f /user/$USER/wordcount/output
hdfs dfs -put  /software/matlab-2014b-x86_64/toolbox/distcomp/examples/integration/old/pbs/README /user/$USER/wordcount/

# count lines in a file:

hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -input /user/$USER/wordcount/README -output /user/$USER/wordcount/streaming-out -mapper '/bin/cat' -reducer '/usr/bin/wc -l'

hdfs dfs -ls /user/$USER/wordcount/streaming-out

hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -input /user/$USER/wordcount/README -output /user/$USER/wordcount/streaming-out-py -file mapper.py -mapper mapper.py -file reducer.py -reducer reducer.py

hdfs dfs -ls /user/$USER/wordcount/streaming-out-py

# The calculations done in the second example are equivalent to
# cat /software/matlab-2014b-x86_64/toolbox/distcomp/examples/integration/old/pbs/README | python mapper.py | sort | python reducer.py
