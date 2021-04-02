part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movie;

  MovieLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieLoadingFailed extends MovieState {
  final String message;

  MovieLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
