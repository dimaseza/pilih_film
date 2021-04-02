part of 'top_rated_movie_cubit.dart';

abstract class TopRatedMovieState extends Equatable {
  const TopRatedMovieState();

  @override
  List<Object> get props => [];
}

class TopRatedMovieInitial extends TopRatedMovieState {}

class TopRatedMovieLoaded extends TopRatedMovieState {
  final List<Movie> movie;

  TopRatedMovieLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

class TopRatedMovieLoadingFailed extends TopRatedMovieState {
  final String message;

  TopRatedMovieLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
