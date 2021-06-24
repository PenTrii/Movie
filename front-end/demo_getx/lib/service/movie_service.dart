import 'dart:convert';

import 'package:demo_getx/models/movie.dart';
import 'package:demo_getx/service/remote_service.dart';

class MovieService {

  static Future<List<Movie>> getMoviesByIdCategory([Map<String, String> params]) async {
    final String uri = "movie";

    try {
      var response = await RemoteService().get(uri, params);

      if (response.statusCode == 200) {
        var data = response.body;
        return Movie.getListFormJson(jsonDecode(data));
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<Movie> getMovieDetail([Map<String, String> params]) async {
    final String uri = "movie";

    try {
      var response = await RemoteService().get(uri, params);

      if (response.statusCode == 200) {
        var data = response.body;
        return Movie.fromJson(jsonDecode(data));
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<List<Movie>> getMovieTop([Map<String, String> params]) async {
    final String uri = "movie/top";

    try {
      var response = await RemoteService().get(uri, params);

      if (response.statusCode == 200) {
        var data = response.body;
        return Movie.getListFormJson(jsonDecode(data));
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }

  static Future putMovieFavorite([Map<String, String> body]) async {
    final String uri = "movie/favorite";

    try {
      await RemoteService().put(uri, body);
    } catch (e) {
      throw e;
    }
  }
}