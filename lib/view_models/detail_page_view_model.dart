import 'package:flutter/material.dart';
import 'package:my_list/models/movie_genre.dart';

import '../models/movie.dart';

class DetailPageViewModel extends ChangeNotifier {
  DetailPageViewModel({required this.movie, required this.movieGenres});

  Movie movie;
  List<MovieGenre> movieGenres;
}
