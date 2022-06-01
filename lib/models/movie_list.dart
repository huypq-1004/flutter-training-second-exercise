import 'package:my_list/models/movie.dart';

class MovieList {
  MovieList(
      {required this.page,
      required this.movies,
      required this.totalPages,
      required this.totalMovies});

  factory MovieList.fromJSON(Map map) {
    var page = map['page'];
    List moviesJSON = map['results'];
    List<Movie> movies = [];
    for (var movieJSON in moviesJSON) {
      movies.add(Movie.fromJSON(movieJSON));
    }
    var totalPages = map['total_pages'];
    var totalMovies = map['total_results'];
    return MovieList(
        page: page,
        movies: movies,
        totalPages: totalPages,
        totalMovies: totalMovies);
  }

  final int page;
  final List<Movie> movies;
  final int totalPages;
  final int totalMovies;
}
