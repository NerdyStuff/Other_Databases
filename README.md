# Other Databases
This Repository is for the course 'advanced / other databases' at DHBW Mannheim.

## General
With this Project we want to analyze dependencies between films and actors. Therefore we used the dataset from [IMDb](https://www.imdb.com).

The dataset can be downloaded from [here](https://datasets.imdbws.com/), the documentation of the dataset can be found [here](https://www.imdb.com/interfaces/).

For this project we wanted to use a graph based database, to show advantages and disadvantages of data stored in graph based databases.

## Method
To analyze the dataset and show advantages and disadvantages of graph based databases we downloaded the dataset from IMDb. The given datasets are stored as tab separated values (tsv). We created a relational database with [MariaDB](https://mariadb.org/) and put the data in it. We used this method, to fastly read data from the dataset. 
At first we wanted to use MariaDb to run own SQL queries to get relevant data from the given dataset. But there was an easier way to import the data to our graph database, so we used the MariaDB just as a converter from TSV files to CSV files, which can easily be imported.
The way we imported the data is described in the section 'Documentation'.

## Documentation
- **TODO**

1. First we created a docker container with neo4j on a linux server, to have a better access to the graph database with multiple users.
2. After that we created a new folder and downloaded the .tsv files into this download folder with the command line tool 'wget'.
With these commands we created a new folder called 'downloads' and enter it:
```
mkdir downloads
cd downloads
```

With these commands we downloaded the files via 'wget':
```
wget https://datasets.imdbws.com/name.basics.tsv.gz
wget https://datasets.imdbws.com/title.akas.tsv.gz
wget https://datasets.imdbws.com/title.basics.tsv.gz
wget https://datasets.imdbws.com/title.crew.tsv.gz
wget https://datasets.imdbws.com/title.episode.tsv.gz
wget https://datasets.imdbws.com/title.principals.tsv.gz
wget https://datasets.imdbws.com/title.ratings.tsv.gz
```
3. The downloaded files were compressed as .gz files, so we used 'gunzip' in our downloads directory to extract them.
```
gunzip *
```

4. We installed MariaDB, created a database called 'IMDB' and inserted the values from the .tsv files with the SQL statements, which can be found in [/SQL/Commands.sql](https://github.com/NerdyStuff/Other_Databases/blob/master/SQL/Commands.sql).
At the end of this file we extract the database data and store them in a CSV file, which is saved in the '/tmp' directory.

With this command we created a database called 'IMDB':
```
CREATE DATABASE IMDB;
```
Then we ran the queries from the .sql file.
With these queries, we created tables, filled them with dta, removed some false data records and finally exported the datasets into a CSV file. As Fieldterminator we used a ';', because a ',' would have caused issues with our importing statements in cypher.
The ',' were used, to split the arrays of people, which were provided as regular string in the downloaded TSV files.

5. We used the cypher shell to import the CSV files therefore we used the statements, which can be found in [/Cypher/Commands.cypher](https://github.com/NerdyStuff/Other_Databases/blob/master/Cypher/Commands.cypher).

With this command we opened a cypher-shell to import the data:
```
cypher-shell -a localhost -u <username> -p <password>
```
The import of the datasets took quite a long time, which is caused by the massive amount of nodes which were created during the import process (almost 83 millions). Also the needed RAM increased drastically.

## Used tools and software
1. **[Umlet](https://www.umlet.com/)** for ER-Modeling of IMDb dataset
2. **[docker](https://www.docker.com/)** as container engine
3. **[MariaDB](https://mariadb.org/)** to store the data from IMDb
4. **[Neo4J](https://neo4j.com/)** as graph database
5. **[wget](https://wiki.ubuntuusers.de/wget/) as download tool**
6. **[gunzip](https://linux.die.net/man/1/gunzip) to extract files**


**CHANGE**
100. **[IntelliJ](https://www.jetbrains.com/idea/)** to write the SQL to Cypher Program




## References
* [NeoJ docker](https://hub.docker.com/_/neo4j)
* [Create CSV file with headers](https://stackoverflow.com/questions/5941809/include-headers-when-using-select-into-outfile/5941905)
* [Getting started with neo4j](https://neo4j.com/developer/get-started/)
* [Cypher-shell](https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/)
* [Import CSV data to neo4j](https://neo4j.com/developer/guide-importing-data-and-etl/)
* [How to extract .gz files](https://tecadmin.net/extract-gz-file-in-linux-command/)
* [IMDB DBMS from Github](https://github.com/TheSarang/IMDB-Database-Management-System/blob/master/SQL_Queries_RESULTS.pdf)
* [IMDb Dataset](https://datasets.imdbws.com/)
* [IMDb Dataset Interface](https://www.imdb.com/interfaces/)

### Cypher Cheatsheet
A cheatsheet for Cypher can be found [here](https://people.inf.elte.hu/kiss/13kor/Neo4j_CheatSheet_v3.pdf).
