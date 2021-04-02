import 'dart:convert';

import 'package:pilih_film/models/api_return_value.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/models/tv/tv_models.dart';
import 'package:http/http.dart' as http;
import 'package:pilih_film/models/tv/tv_shows_detail.dart';
import 'package:pilih_film/models/tv/tv_shows_genre.dart';
import 'package:pilih_film/shared/shared.dart';

class TvShowsServices {
  static Future<ApiReturnValue<List<TVShows>>> getAllTvShows(int page,
      {http.Client client}) async {
    String url =
        'https://api.themoviedb.org/3/discover/tv?api_key=$apiKey&language=en-US&page=$page&with_original_language=en';

    client ??= http.Client();

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again later!");
    }

    var data = jsonDecode(response.body);

    List<TVShows> tvShows = (data['results'] as Iterable)
        .map((tv) => TVShows.fromJson(tv))
        .toList();

    return ApiReturnValue(value: tvShows);
  }

  static Future<ApiReturnValue<List<TVShows>>> getOnTheAir(
      {http.Client client}) async {
    String url =
        'https://api.themoviedb.org/3/tv/on_the_air?api_key=$apiKey&language=en-US&page=1';

    client ??= http.Client();

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again later!");
    }

    var data = jsonDecode(response.body);

    List<TVShows> tvShows = (data['results'] as Iterable)
        .map((tv) => TVShows.fromJson(tv))
        .toList();

    return ApiReturnValue(value: tvShows);
  }

  static Future<TvShowsDetail> getDetails(TVShows tvShows,
      {int tvShowsID, http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/tv/${tvShowsID ?? tvShows.id}?api_key=$apiKey&language=en-US";

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

    return tvShowsID != null
        ? TvShowsDetail(TVShows.fromJson(data),
            languages: language,
            genres: genre
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList())
        : TvShowsDetail(tvShows,
            languages: language,
            genres: genre
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList());
  }

  static Future<ApiReturnValue<List<TVShows>>> getTrendingTvShows(
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/trending/tv/week?api_key=$apiKey";

    client ??= http.Client();

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again later!");
    }

    var data = jsonDecode(response.body);

    List<TVShows> tvShows = (data['results'] as Iterable)
        .map(
          (tv) => TVShows.fromJson(tv),
        )
        .toList();

    return ApiReturnValue(value: tvShows);
  }

  static Future<ApiReturnValue<List<TvShowsGenre>>> getListGenre(
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/genre/tv/list?api_key=$apiKey&language=en-US";

    client ??= http.Client();

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again later!");
    }

    var data = jsonDecode(response.body);

    List<TvShowsGenre> genres = (data['genres'] as Iterable)
        .map((genre) => TvShowsGenre.fromJson(genre))
        .toList();

    return ApiReturnValue(value: genres);
  }

  static Future<List<Credit>> getCredits(int tvShowsId,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/tv/$tvShowsId/credits?api_key=$apiKey";

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
}
