import 'dart:convert';

import 'package:pilih_film/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:pilih_film/shared/shared.dart';

class MovieServices {
  static Future<ApiReturnValue<List<Movie>>> getAllMovies(int page,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&page=$page&with_original_language=en";

    client ??= http.Client();

    var response = await client.get(url);

    print('Status Code Get All Movies: ' + '${response.statusCode}');
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again later!");
    }

    var data = jsonDecode(response.body);

    print('Result All Movies: ${data['results']}');

    List<Movie> movies = (data['results'] as Iterable)
        .map((movie) => Movie.fromJson(movie))
        .toList();

    return ApiReturnValue(value: movies);
  }

  static Future<ApiReturnValue<List<Movie>>> getTrendingMovies(
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/trending/movie/week?api_key=$apiKey";

    client ??= http.Client();

    var response = await client.get(url);
    print('Status Code Trending Movies: ' + '${response.statusCode}');

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again later!");
    }

    var data = jsonDecode(response.body);
    print('Result Trending Movies: ${data['results']}');

    List<Movie> movies = (data['results'] as Iterable)
        .map((movie) => Movie.fromJson(movie))
        .toList();

    return ApiReturnValue(value: movies);
  }

  static Future<MovieDetail> getDetails(Movie movie,
      {int movieID, http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/${movieID ?? movie.id}?api_key=$apiKey&language=en-US";

    client ??= http.Client();

    var response = await client.get(url);
    var data = jsonDecode(response.body);

    List genre = (data as Map<String, dynamic>)['genres'];
    String language;

    switch ((data as Map<String, dynamic>)['original_language'].toString()) {
      case 'ja':
        language = "Japanase";
        break;
      case 'ko':
        language = "Korean";
        break;
      case 'id':
        language = "Indonesian";
        break;
      case 'en':
        language = "English";
        break;
    }

    return movieID != null
        ? MovieDetail(Movie.fromJson(data),
            language: language,
            genres: genre
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList())
        : MovieDetail(movie,
            language: language,
            genres: genre
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList());
  }

  static Future<List<Credit>> getCredits(int movieId,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey";

    client ??= http.Client();

    var response = await client.get(url);
    var data = jsonDecode(response.body);

    return ((data as Map<String, dynamic>)['cast'] as List)
        .map(
          (e) => Credit(
              name: (e as Map<String, dynamic>)['name'],
              profilePath: (e as Map<String, dynamic>)['profile_path']),
        )
        .toList();
  }

  static Future<ApiReturnValue<List<Movie>>> getComingSoonMovies(
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&primary_release_year=2021&with_original_language=en";

    client ??= http.Client();

    var response = await client.get(url);
    print('Status Code Coming Soon Movies: ' + '${response.statusCode}');

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again later!");
    }

    var data = jsonDecode(response.body);
    print('Result Coming Soon Movies: ${data['results']}');

    List<Movie> movies = (data['results'] as Iterable)
        .map(
          (movie) => Movie.fromJson(movie),
        )
        .toList();

    return ApiReturnValue(value: movies);
  }

  static Future<ApiReturnValue<List<Movie>>> getTopRatedMovies(
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1";

    client ??= http.Client();

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again later!");
    }

    var data = jsonDecode(response.body);

    List<Movie> movies = (data['results'] as Iterable)
        .map((movie) => Movie.fromJson(movie))
        .toList();

    return ApiReturnValue(value: movies);
  }

  static Future<ApiReturnValue<List<MovieGenre>>> getListGenre(
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US";

    client ??= http.Client();

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again later!");
    }

    var data = jsonDecode(response.body);

    List<MovieGenre> genres = (data['genres'] as Iterable)
        .map((genre) => MovieGenre.fromJson(genre))
        .toList();

    return ApiReturnValue(value: genres);
  }
}
