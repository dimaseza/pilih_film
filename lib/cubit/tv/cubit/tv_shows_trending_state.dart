part of 'tv_shows_trending_cubit.dart';

abstract class TvShowsTrendingState extends Equatable {
  const TvShowsTrendingState();

  @override
  List<Object> get props => [];
}

class TvShowsTrendingInitial extends TvShowsTrendingState {}

class TvShowsTrendingLoaded extends TvShowsTrendingState {
  final List<TVShows> tvShows;

  TvShowsTrendingLoaded(this.tvShows);

  @override
  List<Object> get props => [tvShows];
}

class TvShowsTrendingLoadingFailed extends TvShowsTrendingState {
  final String message;

  TvShowsTrendingLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
