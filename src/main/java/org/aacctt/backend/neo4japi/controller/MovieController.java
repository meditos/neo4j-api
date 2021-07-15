package org.aacctt.backend.neo4japi.controller;

import org.aacctt.backend.neo4japi.entity.Greeting;
import org.aacctt.backend.neo4japi.entity.MovieEntity;
import org.aacctt.backend.neo4japi.repository.MovieRepository;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("")
public class MovieController {

    private final MovieRepository movieRepository;

    public MovieController(MovieRepository movieRepository) {
        this.movieRepository = movieRepository;
    }

    @PutMapping
    MovieEntity createOrUpdateMovie(@RequestBody MovieEntity newMovie) {
        return movieRepository.save(newMovie);
    }

    @GetMapping(value = { "/movies", "/" }, produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    @ResponseBody
    List<MovieEntity> getMovies() {
        return movieRepository.findAll();
    }

    @GetMapping("/hello-world")
    @ResponseBody
    public Greeting sayHello(@RequestParam(name="name", required=false, defaultValue="Stranger") String name) {
        return new Greeting(1, String.format("Hello, %s!", name));
    }

    @GetMapping("/by-title")
    @ResponseBody
    MovieEntity byTitle(@RequestParam String title) {
        return movieRepository.findOneByTitle(title);
    }

    @DeleteMapping("/{id}")
    void delete(@PathVariable String id) {
        movieRepository.deleteById(id);
    }
}
