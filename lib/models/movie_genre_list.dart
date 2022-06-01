import 'package:my_list/models/movie.dart';
import 'package:my_list/models/movie_genre.dart';

class MovieGenreList {
  const MovieGenreList({required this.genres});

  final List<MovieGenre> genres;

  factory MovieGenreList.fromJSON(Map map) {
    List genresJSON = map['genres'];
    List<MovieGenre> genres = [];
    for (var genreJSON in genresJSON) {
      genres.add(MovieGenre.fromJSON(genreJSON));
    }
    return MovieGenreList(genres: genres);
  }
}
