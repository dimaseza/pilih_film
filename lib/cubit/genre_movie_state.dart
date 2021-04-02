part of 'genre_movie_cubit.dart';

abstract class GenreMovieState extends Equatable {
  const GenreMovieState();

  @override
  List<Object> get props => [];
}

class GenreMovieInitial extends GenreMovieState {}

class GenreMovieLoaded extends GenreMovieState {
  final List<MovieGenre> genre;

  GenreMovieLoaded(this.genre);

  @override
  List<Object> get props => [genre];
}

class GenreMovieLoadingFailed extends GenreMovieState {
  final String message;

  GenreMovieLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
