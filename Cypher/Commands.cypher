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
CREATE (:title_akas {titleId: toInteger(row.titleId), ordering: toInteger(row.ordering), title: row.title, region: row.region, language: row.language, types: split(row.types, ","), attributes: split(row.attributes, ","), isOriginalTitle: row.isOriginalTitle});

//Create name_basics
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///name_basics.csv" AS row FIELDTERMINATOR ';'
CREATE (:name_basics {nconst: row.nconst, primaryName: row.primaryName, birthYear: row.birthYear, deathYear: row.deathYear, primaryProfession: split(row.primaryProfession, ","), knownForTitles: split(row.knownForTitles, ",")});

//Create title_basics
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///title_basics.csv" AS row FIELDTERMINATOR ';'
CREATE (:title_basics {tconst: row.tconst, titleType: row.titleType, primaryTitle: row.primaryTitle, originalTitle: row.originalTitle, isAdult: row.isAdult, startYear: row.startYear, endYear: row.endYear, runtimeMinutes: toInteger(row.runtimeMinutes), genre: split(row.genre, ",")});


//-------------------------
// TODO

//Create title_principals
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///title_principals.csv" AS row FIELDTERMINATOR ';'
CREATE (:title_principals {tconst: row.tconst, ordering: row.ordering, nconst: row.nconst, category: row.category, job: row.job, characters: row.characters});

