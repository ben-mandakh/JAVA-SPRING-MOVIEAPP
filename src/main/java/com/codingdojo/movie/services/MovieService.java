package com.codingdojo.movie.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.codingdojo.movie.models.Movie;
import com.codingdojo.movie.repositories.MovieRepository;

@Service
public class MovieService {
    private final MovieRepository movieRepository;
    
    public MovieService(MovieRepository movieRepository) {
        this.movieRepository = movieRepository;
    }
    public List<Movie> allMovies() {
        return movieRepository.findAll();
    }
    public void createMovie(@Valid Movie movie) {
        movieRepository.save(movie);
    }
    public Movie findMovie(Long id) {
        Optional<Movie> optionalMovie = movieRepository.findById(id);
        if(optionalMovie.isPresent()) {
            return optionalMovie.get();
        } else {
            return null;
        }
    }
	public MovieRepository getMovieRepository() {
		return movieRepository;
	}
	public void updateMovie(Movie movie) {
		movieRepository.save(movie);
		
	}
	public void deleteMovie(Long id) {
		movieRepository.deleteById(id);
		
	}
}
