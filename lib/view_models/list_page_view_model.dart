import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_list/models/movie.dart';
import 'package:my_list/models/movie_genre_list.dart';
import 'package:my_list/models/movie_list.dart';
import 'package:my_list/repository/movies_repository.dart';

import '../models/movie_genre.dart';

class ListPageViewModel extends ChangeNotifier {
  MovieList? _movieList;
  MovieGenreList? _movieGenreList;
  final MoviesRepository repository = MoviesRepository();

  UnmodifiableListView<Movie> get movies =>
      UnmodifiableListView(_movieList?.movies ?? []);

  UnmodifiableListView<MovieGenre> get movieGenres =>
      UnmodifiableListView(_movieGenreList?.genres ?? []);

  void onListPageInit() {
    _getMovieList();
  }

  void _getMovieList() {
    Future.wait([repository.getMovieGenres(), repository.getPopularMovies()])
        .then((value) => _updateData(value))
        .whenComplete(() => {notifyListeners()});
  }

  void _updateData(List response) {
    _movieGenreList = response[0];
    _movieList = response[1];
  }
}
