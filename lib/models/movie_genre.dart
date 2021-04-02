import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MovieGenre extends Equatable {
  final int id;
  final String name;

  MovieGenre({
    @required this.id,
    @required this.name,
  });

  factory MovieGenre.fromJson(Map<String, dynamic> json) => MovieGenre(
        id: json['id'],
        name: json['name'],
      );
  @override
  List<Object> get props => [id, name];
}
