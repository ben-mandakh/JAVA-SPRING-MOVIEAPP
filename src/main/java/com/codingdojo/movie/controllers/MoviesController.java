package com.codingdojo.movie.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.movie.models.Movie;
import com.codingdojo.movie.services.MovieService;

@Controller
public class MoviesController {
	private final MovieService movieService;
    
	public MoviesController(MovieService movieService){
        this.movieService = movieService;
    }
	
	
	@RequestMapping("/movies")
    public String index(Model model) {
        List<Movie> movies = movieService.allMovies();
        model.addAttribute("movies", movies);
        return "/movies/index.jsp";
    }
	
	@RequestMapping("/movies/new")
    public String newMovie(Model model) {
		model.addAttribute("newMovieObject", new Movie());
        return "/movies/new.jsp";
    }
    @RequestMapping(value="/movies", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("newMovieObject") Movie movie, BindingResult result) {
        if (result.hasErrors()) {
            return "/movies/new.jsp";
        } else {
            movieService.createMovie(movie);
            return "redirect:/movies";
        }
    }
    
    /////////////////////// SHOW ROUTE /////////////////////////////////////////
    
    @RequestMapping("/movies/{id}/show")
    public String show(Model model, @PathVariable("id") Long id) {
        Movie movie = movieService.findMovie(id);
        model.addAttribute("showMovieObject", movie);
        return "/movies/show.jsp";
    }
    
    
    
    /////////////////////// UPDATE ROUTE /////////////////////////////////////////
    
    @RequestMapping("/movies/{id}/edit")
    public String edit(Model model, @PathVariable("id") Long id) {
        Movie movie = movieService.findMovie(id);
        model.addAttribute("editMovieObject", movie);
        return "/movies/edit.jsp";
    }
    
    /////////////////////// UPDATE FUNCTION ///////////////////////////////////////

    @RequestMapping(value="/movies/{id}", method=RequestMethod.POST)
    public String update(@Valid @ModelAttribute("editMovieObject") Movie movie, @PathVariable("id") Long id, BindingResult result) {
        if (result.hasErrors()) {
            return "/movies/edit.jsp";
        } else {
            movieService.updateMovie(movie);
            return "redirect:/movies";
        }
    }
    
    /////////////////////// DELETE ROUTE /////////////////////////////////////////
    
    @RequestMapping(value="/movies/{id}/delete", method=RequestMethod.POST)
    public String deleteMovie(@PathVariable("id") Long id) {
        movieService.deleteMovie(id);
        return "redirect:/movies";
    }
    
}
