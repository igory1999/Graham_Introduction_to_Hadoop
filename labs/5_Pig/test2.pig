-- Read mary.txt into records containing lines

in = load 'pig/mary.txt' as (line);

-- Split each line into words and collect words into records 'words'

words = foreach in generate flatten(TOKENIZE(line)) as word;

-- Group words by key (word), with a value consisting of a bag of words

grpd = group words by word;

-- Compute the size of each bag associated with a word

cntd = foreach grpd generate group, COUNT(words);

-- Store the results

store cntd into 'cntd.out';
