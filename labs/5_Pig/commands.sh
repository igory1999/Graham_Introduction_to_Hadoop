#!/bin/bash

cat /usr/share/dict/linux.words | grep -v ',' | perl -ne 'chomp;print "$_,$.\n"' > words.csv
cut -d',' -f2 words.csv | python -c 'import sys;print; print sum(map(lambda x: int(x.strip()), sys.stdin.readlines()))'
python -c 'n=479826; print n*(n+1)/2'

hdfs dfs -mkdir pig
hdfs dfs -put words.csv pig/
pig -x mapreduce test1.pig

hdfs dfs -put mary.txt pig/
hdfs dfs -rm -r cntd.out
pig -x mapreduce test2.pig
hdfs dfs -cat cntd.out/par*
hdfs dfs -rm pig/mary.txt

pig -x mapreduce test3.pig
