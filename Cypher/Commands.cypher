//Create title_basics
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/title_basics.csv" AS row
CREATE (:title_basics {tconst: row.tconst, originalTitle: row.originalTitle, primaryTitle: row.primaryTitle, genre: split(row.genre, ","), runtimeMinutes: row.runtimeMinutes, titleType: row.titleType, isAdult: row.isAdult, startYear: row.startYear, endYear: row.endYear});

//Create title_ratings
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/title_ratings.csv" AS row
CREATE (:title_ratings {numVotes: row.numVotes, averageRating: row.averageRating});

//Create title_episodes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/title_episode.csv" AS row
CREATE (:title_episode {tconst: row.tconst, seasonNumber: row.seasonNumber, episodeNumber: row.episodeNumber});

//Create name_basics
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/name_basics.csv" AS row
CREATE (:name_basics {nconst: row.nconst, primaryName: row.primaryName, birthYear: row.birthYear, deathYear: row.deathYear, primaryProfession: split(row.primaryProfession, ","), knownForTitles: split(row.knownForTitles, ",")});

//Create title_crew
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/title_crew.csv" AS row
CREATE (:title_crew {directors: split(row.directors, ","), writers: split(row.writers, ",")});

//Create title_akas
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/title_akas.csv" AS row
CREATE (:title_akas {ordering: row.ordering, region: row.region, titleId: row.titleId, title: row.title, language: row.language, types: split(row.types, ","), attributes: split(row.attributes, ","), isOriginalTitle: row.isOriginalTitle});

//Create title_principals
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/title_principals.csv" AS row
CREATE (:title_principals {ordering: row.ordering, category: row.category, job: row.job, characters: row.characters});