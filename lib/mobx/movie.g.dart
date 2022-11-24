// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieMobx on _MovieMobx, Store {
  late final _$moviesAtom = Atom(name: '_MovieMobx.movies', context: context);

  @override
  ObservableList<MovieModel> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<MovieModel> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$newMovieIDAtom =
      Atom(name: '_MovieMobx.newMovieID', context: context);

  @override
  int get newMovieID {
    _$newMovieIDAtom.reportRead();
    return super.newMovieID;
  }

  @override
  set newMovieID(int value) {
    _$newMovieIDAtom.reportWrite(value, super.newMovieID, () {
      super.newMovieID = value;
    });
  }

  late final _$_MovieMobxActionController =
      ActionController(name: '_MovieMobx', context: context);

  @override
  void initial() {
    final _$actionInfo =
        _$_MovieMobxActionController.startAction(name: '_MovieMobx.initial');
    try {
      return super.initial();
    } finally {
      _$_MovieMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveMovie(
      String title, String director, List<Genre> genre, String summary) {
    final _$actionInfo =
        _$_MovieMobxActionController.startAction(name: '_MovieMobx.saveMovie');
    try {
      return super.saveMovie(title, director, genre, summary);
    } finally {
      _$_MovieMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateMovie(int id, String title, String director, List<Genre> genre,
      String summary) {
    final _$actionInfo = _$_MovieMobxActionController.startAction(
        name: '_MovieMobx.updateMovie');
    try {
      return super.updateMovie(id, title, director, genre, summary);
    } finally {
      _$_MovieMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteMovie(int id) {
    final _$actionInfo = _$_MovieMobxActionController.startAction(
        name: '_MovieMobx.deleteMovie');
    try {
      return super.deleteMovie(id);
    } finally {
      _$_MovieMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
newMovieID: ${newMovieID}
    ''';
  }
}
