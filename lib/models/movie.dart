import 'movie_genre.dart';

class Movie {
  const Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterURL,
      required this.backdropURL,
      required this.voteAverage,
      required this.releaseDate,
      required this.genreIDs});

  final int id;
  final String title;
  final String overview;
  final String posterURL;
  final String backdropURL;
  final double voteAverage;
  final String releaseDate;
  final List<int> genreIDs;

  static const String _defaultImageBase = 'https://image.tmdb.org/t/p/w500';

  factory Movie.fromJSON(Map map) {
    var id = map['id'];
    var title = map['title'];
    var overview = map['overview'];
    String posterPath = map['poster_path'];
    String backdropPath = map['backdrop_path'];
    var voteAverage = map['vote_average'];
    if (voteAverage is int) {
      voteAverage = voteAverage.toDouble();
    }
    var releaseDate = map['release_date'];
    List genreIDValues = map['genre_ids'];
    List<int> genreIDs = [];
    for (var genreIDValue in genreIDValues) {
      var genreID = genreIDValue as int;
      genreIDs.add(genreID);
    }
    return Movie(
        id: id,
        title: title,
        overview: overview,
        posterURL: _defaultImageBase + posterPath,
        backdropURL: _defaultImageBase + backdropPath,
        voteAverage: voteAverage,
        releaseDate: releaseDate,
        genreIDs: genreIDs);
  }

  String getGenres(List<MovieGenre> genres) {
    List<String> genreStrings = [];
    for (var genreID in genreIDs) {
      for (var genre in genres) {
        if (genre.id == genreID) {
          genreStrings.add(genre.name);
        }
      }
    }
    return genreStrings.join(', ');
  }
}
