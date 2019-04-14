-- Read records from CSV file

records = LOAD 'pig/words.csv' USING PigStorage(',') AS (W, N:int);

-- Select only those records for which N < 10

r1 = filter records by N < 10;

-- Print results

dump r1;

-- Based on r1 records, compute r2 records
-- with N^2, W

r2 = foreach r1 generate N*N as N2, W;
describe r2;
dump r2;

-- Join r1 and r2 tables by W key

r3 = join r1 by W, r2 by W;
describe r3;
dump r3;

