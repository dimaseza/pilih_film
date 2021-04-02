part of 'movie_trending_cubit.dart';

abstract class MovieTrendingState extends Equatable {
  const MovieTrendingState();

  @override
  List<Object> get props => [];
}

class MovieTrendingInitial extends MovieTrendingState {}

class MovieTrendingLoaded extends MovieTrendingState {
  final List<Movie> movie;

  MovieTrendingLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieTrendingLoadingFailed extends MovieTrendingState {
  final String message;

  MovieTrendingLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
