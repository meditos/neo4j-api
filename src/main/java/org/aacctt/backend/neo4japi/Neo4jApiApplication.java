package org.aacctt.backend.neo4japi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.neo4j.repository.config.EnableReactiveNeo4jRepositories;

@EnableReactiveNeo4jRepositories
@SpringBootApplication
public class Neo4jApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(Neo4jApiApplication.class, args);
	}

}
