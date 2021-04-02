part of 'coming_soon_cubit.dart';

abstract class ComingSoonState extends Equatable {
  const ComingSoonState();

  @override
  List<Object> get props => [];
}

class ComingSoonInitial extends ComingSoonState {}

class ComingSoonLoaded extends ComingSoonState {
  final List<Movie> movie;

  ComingSoonLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

class ComingSoonLoadingFailed extends ComingSoonState {
  final String message;

  ComingSoonLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
