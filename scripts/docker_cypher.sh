# Telling docker to run bash within our container, allowing us to interact with our container using Linux bash commands
docker exec -it testneo4j bash
# Start cypher shell
cypher-shell -u neo4j -p secret