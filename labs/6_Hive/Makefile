generate: 
	./generate_commands.sh
data:
	hdfs dfs -mkdir pig | true
	hdfs dfs -put ../5_Pig/words.csv pig/
batch: 
	hive -f commands.sql > out.txt 2> err.txt
sql:
	hive --database ${USER} -e 'select * from t1 limit 5;'
clean:
	rm -f commands commands.sql *.txt *~
