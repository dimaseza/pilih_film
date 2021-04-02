import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final List<int> genreId;

  Movie({
    @required this.id,
    @required this.title,
    @required this.voteAverage,
    @required this.overview,
    @required this.posterPath,
    @required this.backdropPath,
    @required this.releaseDate,
    @required this.genreId,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'],
        title: json['title'],
        voteAverage: (json['vote_average'] as num).toDouble(),
        overview: json['overview'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        releaseDate: json['release_date'],
        genreId: json['genre_ids'].cast<int>(),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'voteAverage': voteAverage,
      'overview': overview,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
      'releaseDate': releaseDate,
      'genreId': genreId,
    };
  }

  @override
  List<Object> get props => [
        id,
        title,
        voteAverage,
        overview,
        posterPath,
        backdropPath,
        releaseDate,
        genreId,
      ];
}
