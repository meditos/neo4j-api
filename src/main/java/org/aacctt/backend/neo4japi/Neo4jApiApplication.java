package org.aacctt.backend.neo4japi;

import org.neo4j.driver.Driver;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.neo4j.core.ReactiveDatabaseSelectionProvider;
import org.springframework.data.neo4j.core.transaction.ReactiveNeo4jTransactionManager;

@SpringBootApplication
public class Neo4jApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(Neo4jApiApplication.class, args);
	}

	@Bean
	ReactiveNeo4jTransactionManager reactiveTransactionManager(Driver driver, ReactiveDatabaseSelectionProvider databaseSelectionProvider) {
		return new ReactiveNeo4jTransactionManager(driver, databaseSelectionProvider);
	}
}
