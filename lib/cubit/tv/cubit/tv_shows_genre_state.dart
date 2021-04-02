part of 'tv_shows_genre_cubit.dart';

abstract class TvShowsGenreState extends Equatable {
  const TvShowsGenreState();

  @override
  List<Object> get props => [];
}

class TvShowsGenreInitial extends TvShowsGenreState {}

class TvShowsGenreLoaded extends TvShowsGenreState {
  final List<TvShowsGenre> tvShowsGenre;

  TvShowsGenreLoaded(this.tvShowsGenre);

  @override
  List<Object> get props => [tvShowsGenre];
}

class TvShowsGenreLoadingFailed extends TvShowsGenreState {
  final String message;

  TvShowsGenreLoadingFailed(this.message);
}
