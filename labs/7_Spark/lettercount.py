#!/usr/bin/python

from pyspark import SparkContext

import os
user = os.getenv("USER")

filename = "hdfs:///user/" + user + "/test1/input/linux.words"

# establish a spark context on our server.
sc = SparkContext("yarn-client","SparkExample")

# could also do it locally on your laptop etc.:
#sc = SparkContext("local","SparkExample")

# cache the data in memory to avoid recomputation
filedata = sc.textFile(filename).cache()

numAs = filedata.filter(lambda s: 'a' in s).count()
numBs = filedata.filter(lambda s: 'b' in s).count()

print "Lines with a: %s, lines with b: %s" % (numAs, numBs)
