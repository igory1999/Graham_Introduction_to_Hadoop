#!/bin/bash

hdfs dfs -ls /user/$USER
hdfs dfs -ls
hdfs dfs -mkdir /user/$USER/test2
hdfs dfs -put /usr/share/dict/linux.words /user/$USER/test2/
hdfs dfs -ls -h  /user/$USER/test2/                                                                                                                   
hdfs dfs -setrep 4  /user/$USER/test2/linux.words
hdfs dfs -ls -h  /user/$USER/test2/
hdfs dfs -mv /user/$USER/test2/linux.words /user/$USER/test2/words.txt
hdfs dfs -get /user/$USER/test2/words.txt
hdfs dfs -rm /user/$USER/test2/words.txt
hdfs dfs -rm -r /user/$USER/test2
