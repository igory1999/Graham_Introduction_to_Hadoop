hdfs dfs -mkdir -p /user/${USER}/test1/input
hdfs dfs -put /usr/share/dict/linux.words /user/${USER}/test1/input/
spark-submit lettercount.py 2
# pyspark
# sc._conf.getAll()
# to find out Context
