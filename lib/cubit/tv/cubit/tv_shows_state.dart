part of 'tv_shows_cubit.dart';

abstract class TvShowsState extends Equatable {
  const TvShowsState();

  @override
  List<Object> get props => [];
}

class TvShowsInitial extends TvShowsState {}

class TvShowsLoaded extends TvShowsState {
  final List<TVShows> tvShows;

  TvShowsLoaded(this.tvShows);

  @override
  List<Object> get props => [tvShows];
}

class TvShowsLoadingFailed extends TvShowsState {
  final String message;

  TvShowsLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
