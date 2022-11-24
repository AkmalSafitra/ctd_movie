import 'package:ctd_movie/core/genre.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../core/movie_model.dart';

part 'movie.g.dart';

class MovieMobx = _MovieMobx with _$MovieMobx;

abstract class _MovieMobx with Store {
  // @observable
  // List<MovieModel> movies = [
  //   MovieModel(id: 0,
  //       title: 'wewewe',
  //       director: 'kiki',
  //       genres: [genre[0]],
  //       summary: 'bersama kiki')
  // ];
  @observable
  ObservableList<MovieModel> movies = ObservableList<MovieModel>();

  @observable
  int newMovieID = 1;

  @action
  void initial() {
    movies.add(
      MovieModel(
          id: 0,
          title: 'Spider-Man: No Way home',
          director: 'Jon Watts',
          genres: [genre[0], genre[1], genre[2], genre[7]],
          summary:
              'For the first time in the cinematic history of Spider-Man, our friendly neighborhood hero\'s identity is revealed, bringing his Super Hero responsibilities into conflict with his normal life and putting those he cares about most at risk. When he enlists Doctor Strange\'s help to restore his secret, the spell tears a hole in their world, releasing the most powerful villains who\'ve ever fought a Spider-Man in any universe. Now, Peter will have to overcome his greatest challenge yet, which will not only forever alter his own future but the future of the Multiverse.'),
    );
    movies.add(
      MovieModel(
          id: 1,
          title: 'The Batman',
          director: 'Matt Reeves',
          genres: [genre[0], genre[5], genre[7]],
          summary:
              'Batman ventures into Gotham City\'s underworld when a sadistic killer leaves behind a trail of cryptic clues. As the evidence begins to lead closer to home and the scale of the perpetrator\'s plans become clear, he must forge new relationships, unmask the culprit and bring justice to the abuse of power and corruption that has long plagued the metropolis.'),
    );
  }

  @action
  void saveMovie(
    String title,
    String director,
    List<Genre> genre,
    String summary,
  ) {
    debugPrint('title: ' + title);
    debugPrint('director: ' + director);
    debugPrint('genre: ' + genre.toString());
    debugPrint('summary: ' + summary);
    newMovieID++;
    MovieModel newMovie = MovieModel(
      id: newMovieID,
      title: title,
      director: director,
      genres: genre,
      summary: summary,
    );

    movies.add(newMovie);
  }

  @action
  void updateMovie(
    int id,
    String title,
    String director,
    List<Genre> genre,
    String summary,
  ) {
    debugPrint('title: ' + title);
    debugPrint('director: ' + director);
    debugPrint('genre: ' + genre.toString());
    debugPrint('summary: ' + summary);
    MovieModel updatedMovie = MovieModel(
      id: id,
      title: title,
      director: director,
      genres: genre,
      summary: summary,
    );

    movies[movies.indexWhere((element) => element.id == id)] = updatedMovie;
  }

  @action
  void deleteMovie(int id) {
    debugPrint('id remove: ' + id.toString());
    movies.removeWhere((element) => element.id == id);
  }
}
