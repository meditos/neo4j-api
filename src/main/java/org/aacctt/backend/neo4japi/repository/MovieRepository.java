package org.aacctt.backend.neo4japi.repository;

import org.aacctt.backend.neo4japi.entity.MovieEntity;
import org.springframework.data.neo4j.repository.ReactiveNeo4jRepository;
import org.springframework.data.neo4j.repository.query.Query;
import reactor.core.publisher.Mono;
import reactor.core.publisher.Flux;


public interface MovieRepository extends ReactiveNeo4jRepository<MovieEntity, String> {

    Mono<MovieEntity> findOneByTitle(String title);

    @Query("MATCH (node:Movie) RETURN node LIMIT 100")
    Flux<MovieEntity> last100();

    @Query("MATCH (a)-[:ACTED_IN]->(m)<-[:DIRECTED]-(d) RETURN a,m,d LIMIT 100")
    Flux<MovieEntity> tomHMovies();

}
