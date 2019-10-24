-- Create Tables for mariaDB

CREATE TABLE IF NOT EXISTS name_basics(
nconst TEXT NOT NULL,
primaryName TEXT NOT NULL,
birthYear YEAR,
deathYear YEAR,
primaryProfession TEXT,
knownForTitles TEXT
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS title_akas(
titleId TEXT NOT NULL,
ordering INT,
title TEXT,
region TEXT,
language TEXT,
types TEXT,
attributes TEXT,
isOriginalTitle BOOLEAN
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS title_basics(
tconst TEXT,
titleType TEXT,
primaryTitle TEXT,
originalTitle TEXT,
isAdult BOOLEAN,
startYear YEAR,
endYear YEAR,
runtimeMinutes INT,
genres TEXT
) ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS title_crew(
tconst TEXT,
directors TEXT,
writers TEXT
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS title_episode(
tconst TEXT,
parentTconst TEXT,
seasonNumber INT,
episodeNumber INT
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS title_principals(
tconst TEXT,
ordering INT,
nconst TEXT,
category TEXT,
job TEXT,
characters TEXT
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS title_ratings(
tconst TEXT,
averageRating FLOAT,
numVotes INT
) ENGINE=INNODB;

-- Load Data from .TSV files

LOAD DATA LOCAL INFILE '/var/lib/neo4j/data/downloads/name.basics.tsv' INTO TABLE name_basics FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/var/lib/neo4j/data/downloads/title.akas.tsv' INTO TABLE title_akas FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/var/lib/neo4j/data/downloads/title.basics.tsv' INTO TABLE title_basics FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/var/lib/neo4j/data/downloads/title.crew.tsv' INTO TABLE title_crew FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/var/lib/neo4j/data/downloads/title.episode.tsv' INTO TABLE title_episode FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/var/lib/neo4j/data/downloads/title.principals.tsv' INTO TABLE title_principals FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/var/lib/neo4j/data/downloads/title.ratings.tsv' INTO TABLE title_ratings FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n';


-- Create title_basics
SELECT 'tconst', 'originalTitle', 'primaryTitle', 'genre', 'runtimeMinutes', 'titleType', 'isAdult', 'startYear', 'endYear' UNION ALL SELECT * from title_basics INTO OUTFILE '/tmp/title_basics.csv';

-- Create title_akas
SELECT 'titleID', 'ordering', 'title', 'region', 'language', 'types', 'attributes', 'isOriginalTitle' UNION ALL SELECT * from title_akas INTO OUTFILE '/tmp/title_akas.csv';

-- Create title_crew
SELECT 'tconst', 'directors', 'writers' UNION ALL SELECT * from title_crew INTO OUTFILE '/tmp/title_crew.csv';

-- Create title_episode
SELECT 'tconst', 'parentTconst', 'seasonNumber', 'episodeNumber' UNION ALL SELECT * from title_episode INTO OUTFILE '/tmp/title_episode.csv';

-- Create title_principals
SELECT 'tconst', 'ordering', 'nconst', 'category', 'job', 'characters' UNION ALL SELECT * from title_principals INTO OUTFILE '/tmp/title_principals.csv';

-- Create title_ratings
SELECT 'tconst', 'averageRating', 'numVotes' UNION ALL SELECT * from title_ratings INTO OUTFILE '/tmp/title_ratings.csv';

-- Create name_basics
SELECT 'nconst', 'primaryName', 'birthYear', 'deathYear', 'primaryConfession', 'knownForTitles' UNION ALL SELECT * from name_basics INTO OUTFILE '/tmp/name_basics.csv';