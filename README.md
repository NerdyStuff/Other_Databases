# Other Databases
This Repository is for the course 'advanced / other databases' at DHBW Mannheim.

## General
With this Project we want to analyze dependencies between films and actors. Therefore we used the dataset from [IMDb](https://www.imdb.com).

The dataset can be downloaded from [here](https://datasets.imdbws.com/), the documentation of the dataset can be found [here](https://www.imdb.com/interfaces/).

For this project we wanted to use a graph based database, to show advantages and disadvantages of data stored in graph based databases.

## Method
To analyze the dataset and show advantages and disadvantages of graph based databases we downloaded the dataset from IMDb. The given datasets are stored as tab separated values (tsv). We created a relational database with [MariaDB](https://mariadb.org/) and put the data in it. We used this method, to fastly read data from the dataset. Now we can use simple SQL statements to read the data and convert them to graph nodes. Therefore we wrote a program, that generates a file with Cypher statements used for [Neo4J](https://neo4j.com/).

## Documentation
- TODO

## Used Tools
1. **[Umlet](https://www.umlet.com/)** for ER-Modeling of IMDb dataset
2. **[MariaDB](https://mariadb.org/)** to store the data from IMDb
3. **[Neo4J](https://neo4j.com/)** as graph database
4. **[IntelliJ](https://www.jetbrains.com/idea/)** to write the SQL to Cypher Program
