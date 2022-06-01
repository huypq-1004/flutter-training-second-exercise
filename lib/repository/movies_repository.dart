import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_list/models/movie_list.dart';

import '../models/movie_genre_list.dart';

class MoviesRepository {
  final _apiDomain = 'api.themoviedb.org';
  final _apiVersion = '3';
  final _apiKey = '9898481a3f1be7af154c4d55fa677cc1';

  Future<MovieList> getPopularMovies() async {
    var client = http.Client();
    try {
      var json = await _makeJSONRequest('/movie/popular', {'page': '1'});
      return MovieList.fromJSON(json);
    } finally {
      client.close();
    }
  }

  Future<MovieGenreList> getMovieGenres() async {
    var client = http.Client();
    try {
      var json = await _makeJSONRequest('/genre/movie/list', null);
      var movieGenreList = MovieGenreList.fromJSON(json);
      return movieGenreList;
    } finally {
      client.close();
    }
  }

  Future<Map> _makeJSONRequest(
      String path, Map<String, dynamic>? additionalQuery) async {
    var client = http.Client();
    try {
      Map<String, dynamic> query = {'api_key': _apiKey, 'language': 'en-US'};
      if (additionalQuery != null) {
        query.addAll(additionalQuery);
      }
      Uri uri = Uri.https(_apiDomain, '/$_apiVersion$path', query);
      var response = await client.get(uri);
      var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return jsonResponse;
    } finally {
      client.close();
    }
  }
}
