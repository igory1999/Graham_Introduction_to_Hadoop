-- Read records from CSV file, each record consisting of two fields (W,N), separated by ','
-- If data type is not specified, pig will figure it out. If it is, it might improve performance

records = LOAD 'pig/words.csv' USING PigStorage(',') AS (W, N:int);

-- Group all the records together to apply an aggregate function later:

mrecs = GROUP records ALL;

-- Sum N field from all records:

tot = FOREACH mrecs GENERATE SUM(records.N);


DUMP tot;
