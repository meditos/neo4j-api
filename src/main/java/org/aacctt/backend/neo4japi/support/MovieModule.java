package org.aacctt.backend.neo4japi.support;

import org.aacctt.backend.neo4japi.entity.MovieEntity;
import org.aacctt.backend.neo4japi.entity.PersonEntity;
import org.springframework.boot.jackson.JsonComponent;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.module.SimpleModule;

/**
 * A jackson module supporting our domain package.
 */
@JsonComponent
public class MovieModule extends SimpleModule {

    public MovieModule() {
        setMixInAnnotation(MovieEntity.class, RecordMixin.class);
        setMixInAnnotation(PersonEntity.class, RecordMixin.class);
    }

    @JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    abstract static class RecordMixin {
    }
}
