1. You can use hive:
  * interactively by starting hive shell:
    ```
    hive
    ```
    - good for experimenting, not good for real work
  * by submitting a script in batch:
    ```
    hive -f yourscript.sql > out.txt 2>err.txt
    ```
    - best for serious work; please, use this method for your homework and submit `yourscript.sql`, `out.txt`, `err.txt`
  * by running short sql query from command line:
    ```
    hive --database my1 -e 'select count(*) from mytable;'
    ```
2. Everybody should work with different databases to avoid collisions. 
   * To make it simple: name the database after your username.
   * `generate_commands.sh` takes template file and replaces XYZ by your username:
     ```
     ./generate_commands.sh
     ```
3. If you put csv file into HDFS and load it into hive, it disappears from HDFS since hive simply moves it into its directory without
   changing it. Therefore, if you want to reexecute a script that creates a table from csv file in HDFS, you have 
   to copy it there again.
