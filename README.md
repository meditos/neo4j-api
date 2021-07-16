# Testing instructions

Infrastructure steps:
- Launch scripts/start_server.sh
- Clean and package the project.
- Launch scripts/start_app.sh

In order to fill the graph database:
- Go to a terminal and execute:
    1. docker exec -it testneo4j bash
    2. cypher-shell -u neo4j -p secret
    3. Copy the cypher commands in scripts/cypher/movies.cypher and execute in the cypher-shell.

Testing the graph database:
- Execute scripts/curls/get_movies.sh
- Execute scripts/curls/insert_movie.sh

