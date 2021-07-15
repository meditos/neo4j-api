package org.aacctt.backend.neo4japi.repository;

import org.aacctt.backend.neo4japi.entity.MovieEntity;
import org.springframework.data.neo4j.repository.Neo4jRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MovieRepository extends Neo4jRepository<MovieEntity, String> {
    MovieEntity findOneByTitle(String title);
}
