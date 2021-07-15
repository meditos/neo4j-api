package org.aacctt.backend.neo4japi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"org.aacctt.backend.neo4japi.repository.MovieRepository"})
public class Neo4jApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(Neo4jApiApplication.class, args);
	}

}
