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

-- Remove false headers
DELETE FROM title_basics WHERE tconst = 'tconst';
DELETE FROM title_akas WHERE titleID = 'titleID';
DELETE FROM title_crew WHERE tconst = 'tconst';
DELETE FROM title_episode WHERE tconst = 'tconst';
DELETE FROM title_principals WHERE tconst = 'tconst';
DELETE FROM name_basics WHERE nconst = 'nconst';

-- Correct false field values
   -- title_basics
UPDATE title_basics SET `primaryTitle` = 'After Devastation of "Chernobyl", What to Watch Next', `originalTitle` = 'After Devastation of "Chernobyl", What to Watch Next' WHERE `tconst` = 'tt10432144';
UPDATE title_basics SET `primaryTitle` = 'Swing it', `originalTitle` = 'Swing it' WHERE `tconst` = 'tt0033122';
UPDATE title_basics SET `primaryTitle` = 'After "The Boys", Watch These Supes Next', `originalTitle` = 'After "The Boys", Watch These Supes Next' WHERE `tconst` = 'tt10767180';
UPDATE title_basics SET `primaryTitle` = '"Atlas Shrugged", the Movie: Why Ayn Rand is More Relevant Than Ever', `originalTitle` = '"Atlas Shrugged", the Movie: Why Ayn Rand is More Relevant Than Ever' WHERE `tconst` = 'tt2055043';
UPDATE title_basics SET `primaryTitle` = 'Evangeline Lilly, "Game of Thrones", and What''s Trending Today on IMDb', `originalTitle` = 'Evangeline Lilly, "Game of Thrones", and What''s Trending Today on IMDb' WHERE `tconst` = 'tt7229984';
UPDATE title_basics SET `primaryTitle` = 'Plummer, "SMILF", Chau: Golden Globes 2018 Surprise Noms', `originalTitle` = 'Plummer, "SMILF", Chau: Golden Globes 2018 Surprise Noms' WHERE `tconst` = 'tt7754890';
UPDATE title_basics SET `primaryTitle` = 'Argento Busted, Warren Lunacy, Sweden''s "Problem", + UK Backs South Africa Thugs', `originalTitle` = 'Argento Busted, Warren Lunacy, Sweden''s "Problem", + UK Backs South Africa Thugs' WHERE `tconst` = 'tt8885040';

-- Escape all double quotes
   -- title_basics
UPDATE title_basics SET `tconst` = REPLACE(`tconst`,'"','""'), `originalTitle` = REPLACE(`originalTitle`,'"','""'), `primaryTitle` = REPLACE(`primaryTitle`,'"','""'), `genres` = REPLACE(`genres`,'"','""'), `runtimeMinutes` = REPLACE(`runtimeMinutes`,'"','""'), `titleType` = REPLACE(`titleType`,'"','""'), `isAdult` = REPLACE(`isAdult`,'"','""'), `startYear` = REPLACE(`startYear`,'"','""'), `endYear` =  REPLACE(`endYear`,'"','""');
   -- name_basics
UPDATE name_basics SET `nconst` = REPLACE(`nconst`,'"','""'), `primaryName` = REPLACE(`primaryName`,'"','""'), `birthYear` = REPLACE(`birthYear`,'"','""'), `deathYear` = REPLACE(`deathYear`,'"','""'), `primaryProfession` = REPLACE(`primaryProfession`,'"','""'), `knownForTitles` = REPLACE(`knownForTitles`,'"','""');
   -- title_akas
UPDATE title_akas SET `titleId` = REPLACE(`titleId`,'"','""'), `ordering` = REPLACE(`ordering`,'"','""'), `title` = REPLACE(`title`,'"','""'), `region` = REPLACE(`region`,'"','""'), `language` = REPLACE(`language`,'"','""'), `types` = REPLACE(`types`,'"','""'), `attributes` = REPLACE(`attributes`,'"','""'), `isOriginalTitle` = REPLACE(`isOriginalTitle`,'"','""');
   -- title_crew
UPDATE title_principals SET `tconst` = REPLACE(`tconst`,'"','""'), `directors` = REPLACE(`directors`,'"','""'), `writers` = REPLACE(`writers`,'"','""');
   -- title_episode
UPDATE title_principals SET `tconst` = REPLACE(`tconst`,'"','""'), `ordering` = REPLACE(`ordering`,'"','""'), `nconst` = REPLACE(`nconst`,'"','""'), `category` = REPLACE(`category`,'"','""'), `job` = REPLACE(`job`,'"','""'), `characters` = REPLACE(`characters`,'"','""');

-- Create title_basics
SELECT 'tconst', 'originalTitle', 'primaryTitle', 'genre', 'runtimeMinutes', 'titleType', 'isAdult', 'startYear', 'endYear' UNION ALL SELECT * from title_basics INTO OUTFILE '/tmp/title_basics.csv' FIELDS TERMINATED BY ';' ENCLOSED BY '"';
-- Create title_akas
SELECT 'titleID', 'ordering', 'title', 'region', 'language', 'types', 'attributes', 'isOriginalTitle' UNION ALL SELECT * from title_akas INTO OUTFILE '/tmp/title_akas.csv' FIELDS TERMINATED BY ';' ENCLOSED BY '"';
-- Create title_crew
SELECT 'tconst', 'directors', 'writers' UNION ALL SELECT * from title_crew INTO OUTFILE '/tmp/title_crew.csv' FIELDS TERMINATED BY ';' ENCLOSED BY '"';
-- Create title_episode
SELECT 'tconst', 'parentTconst', 'seasonNumber', 'episodeNumber' UNION ALL SELECT * from title_episode INTO OUTFILE '/tmp/title_episode.csv' FIELDS TERMINATED BY ';' ENCLOSED BY '"';
-- Create title_principals
SELECT 'tconst', 'ordering', 'nconst', 'category', 'job', 'characters' UNION ALL SELECT * from title_principals INTO OUTFILE '/tmp/title_principals.csv' FIELDS TERMINATED BY ';' ENCLOSED BY '"';
-- Create title_ratings
SELECT 'tconst', 'averageRating', 'numVotes' UNION ALL SELECT * from title_ratings INTO OUTFILE '/tmp/title_ratings.csv' FIELDS TERMINATED BY ';' ENCLOSED BY '"';
-- Create name_basics
SELECT 'nconst', 'primaryName', 'birthYear', 'deathYear', 'primaryConfession', 'knownForTitles' UNION ALL SELECT * from name_basics INTO OUTFILE '/tmp/name_basics.csv' FIELDS TERMINATED BY ';' ENCLOSED BY '"';
