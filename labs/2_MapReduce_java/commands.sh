#!/bin/bash

source env.sh

mkdir wordcount_classes
javac -cp /opt/cloudera/parcels/CDH/lib/hadoop/*:/opt/cloudera/parcels/CDH/lib/hadoop/client/* -d wordcount_classes WordCount.java
jar -cvf wordcount.jar -C wordcount_classes/ .

hdfs dfs -mkdir /user/$USER/wordcount
hdfs dfs -rm -r -f /user/$USER/wordcount/output
hdfs dfs -put  /software/matlab-2014b-x86_64/toolbox/distcomp/examples/integration/old/pbs/README /user/$USER/wordcount/

hadoop jar wordcount.jar WordCount /user/$USER/wordcount/README /user/$USER/wordcount/output

hdfs dfs -ls /user/$USER/wordcount/output
hdfs dfs -cat wordcount/output/part-r-00000
hdfs dfs -cat wordcount/output/part-r-000* | sort > out.txt
hdfs dfs -getmerge wordcount/output merged.txt
cat merged.txt | sort



