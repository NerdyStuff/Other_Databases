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
