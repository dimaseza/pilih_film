import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TvShowsGenre extends Equatable {
  final int id;
  final String name;

  TvShowsGenre({
    @required this.id,
    @required this.name,
  });

  factory TvShowsGenre.fromJson(Map<String, dynamic> json) => TvShowsGenre(
        id: json['id'],
        name: json['name'],
      );
  @override
  List<Object> get props => [id, name];
}
