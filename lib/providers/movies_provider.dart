import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/movies_model.dart';
import 'package:peliculas/models/popular_model.dart';

class MoviesProvider extends ChangeNotifier {

  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';
  final String _ApiKey = '1939a5a517a344c386f34374ab209172';

  List<Movie> popularMovies = [];

  int _pagePopular = 0;

  MoviesProvider() {
    getPopularMovies();
  }

  void getPopularMovies() async {

    _pagePopular++;

    final url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key':  _ApiKey,
      'language': _language,
      'page':     '$_pagePopular'
    });

    final response = await http.get(url);
    print(response.body);
    final popularMoviesResponse = PopularModel.fromJson(response.body);
    popularMovies = [...popularMovies, ...popularMoviesResponse.results];
    notifyListeners();
  }

}