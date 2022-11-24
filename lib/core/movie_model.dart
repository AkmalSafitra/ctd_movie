import 'genre.dart';

class MovieModel {
  final int id;
  final String title;
  final String director;
  final List<Genre> genres;
  final String summary;

  MovieModel({
    required this.id,
    required this.title,
    required this.director,
    required this.genres,
    required this.summary,
  });
}
