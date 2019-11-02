//Create title_ratings
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///title_ratings.csv" AS row FIELDTERMINATOR ';'
CREATE (:title_ratings {tconst: row.tconst, numVotes: toInteger(row.numVotes), averageRating: toFloat(row.averageRating)});

//Create title_episode
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///title_episode.csv" AS row FIELDTERMINATOR ';'
CREATE (:title_episode {tconst: row.tconst, parentTconst: row.parentTconst, seasonNumber: toInteger(row.seasonNumber), episodeNumber: toInteger(row.episodeNumber)});

//Create title_crew
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///title_crew.csv" AS row FIELDTERMINATOR ';'
CREATE (:title_crew {tconst: row.tconst, directors: split(row.directors, ","), writers: split(row.writers, ",")});

//Create title_akas
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///title_akas.csv" AS row FIELDTERMINATOR ';'
CREATE (:title_akas {titleID: row.titleID, ordering: toInteger(row.ordering), title: row.title, region: row.region, language: row.language, types: split(row.types, ","), attributes: split(row.attributes, ","), isOriginalTitle: row.isOriginalTitle});

//Create name_basics
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///name_basics.csv" AS row FIELDTERMINATOR ';'
CREATE (:name_basics {nconst: row.nconst, primaryName: row.primaryName, birthYear: row.birthYear, deathYear: row.deathYear, primaryProfession: split(row.primaryProfession, ","), knownForTitles: split(row.knownForTitles, ",")});

//Create title_basics
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///title_basics.csv" AS row FIELDTERMINATOR ';'
CREATE (:title_basics {tconst: row.tconst, titleType: row.titleType, primaryTitle: row.primaryTitle, originalTitle: row.originalTitle, isAdult: row.isAdult, startYear: row.startYear, endYear: row.endYear, runtimeMinutes: toInteger(row.runtimeMinutes), genre: split(row.genre, ",")});

//Create title_principals
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///title_principals.csv" AS row FIELDTERMINATOR ';'
CREATE (:title_principals {tconst: row.tconst, ordering: toInteger(row.ordering), nconst: row.nconst, category: row.category, job: row.job, characters: split(row.characters, ",")});

//Create Relationship between title_basics and title_ratings
MATCH (a:title_basics)
WITH a
MATCH (b:title_ratings)
WHERE a.tconst = b.tconst
CREATE (a)-[r:HAS_RATING]->(b);

//Create Relationship between title_basics and title akas
// This Query needs to be executed multiple times!
MATCH (a:title_basics)
WITH a
MATCH (b:title_akas {titleID: a.tconst})
WHERE NOT b:Processed
WITH a, b
LIMIT 50000
MERGE (a)-[r:HAS_TITLE_AKA]->(b)
SET b:Processed;

// INSERT RELATIONSHIPS HERE



// After all relationships are created remove temporary nodes
// Run this query multiple times at the end of the relationship creation
MATCH (n:Processed)
WITH n LIMIT 50000
REMOVE n:Processed;
