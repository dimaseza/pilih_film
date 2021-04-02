import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TVShows extends Equatable {
  final int id;
  final String name;
  final double voteAverage;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String firstAirDate;
  final List<int> genre;

  TVShows({
    @required this.id,
    @required this.name,
    @required this.voteAverage,
    @required this.overview,
    @required this.posterPath,
    @required this.backdropPath,
    @required this.firstAirDate,
    @required this.genre,
  });

  factory TVShows.fromJson(Map<String, dynamic> json) => TVShows(
        id: json['id'],
        name: json['name'],
        voteAverage: (json['vote_average'] as num).toDouble(),
        overview: json['overview'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        firstAirDate: json['first_air_date'],
        genre: json['genre_ids'].cast<int>(),
      );

  @override
  List<Object> get props => [
        id,
        name,
        voteAverage,
        overview,
        posterPath,
        backdropPath,
        firstAirDate,
        genre,
      ];
}
