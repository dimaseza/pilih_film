part of 'on_the_air_cubit.dart';

abstract class OnTheAirState extends Equatable {
  const OnTheAirState();

  @override
  List<Object> get props => [];
}

class OnTheAirInitial extends OnTheAirState {}

class OnTheAirLoaded extends OnTheAirState {
  final List<TVShows> tvShows;

  OnTheAirLoaded(this.tvShows);

  @override
  List<Object> get props => [tvShows];
}

class OnTheAirLoadingFailed extends OnTheAirState {
  final String message;

  OnTheAirLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
