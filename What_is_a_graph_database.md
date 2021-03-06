# What is a Graph Database?

> "A graph database is a database designed to treat the relationships between data as equally important to the data itself." - [Neo4j](https://neo4j.com/developer/graph-database/)

A Graph Database uses graphs to store and display relationships between the data. 
There are nodes and edges: The nodes represent the entity such as a person. They can have any number of properties. 
The edge represents the relationship between the nodes. They always have a direction, a type, a start node and an end node.
Moreover relationships can have properties, just as nodes. A node can have any number of relationship with another node.

One advantage of a graph database is that its performance stays constant while its data grows unlike the performace of traditional databases. Moreover, it is easy to search quickly for relationships. Finally, the relationships are indexed, resulting in an enhanced reading speed. 

A disadvantage on the other hand is that a graph isn\`t very useful for analysis of a large dataset. Another point to consider is that a graph database isn\`t optimized for handling business data in the sense of business data warehouses. Another important disadvantage is the safety, because the code is partly open source. Finally, the code isn\`t that scaleable. 
