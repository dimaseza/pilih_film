import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/services/movie_services.dart';

part 'top_rated_movie_state.dart';

class TopRatedMovieCubit extends Cubit<TopRatedMovieState> {
  TopRatedMovieCubit() : super(TopRatedMovieInitial());

  Future<void> getTopRatedMovies() async {
    ApiReturnValue<List<Movie>> result =
        await MovieServices.getTopRatedMovies();

    if (result.value != null) {
      emit(TopRatedMovieLoaded(result.value));
    } else {
      emit(TopRatedMovieLoadingFailed(result.message));
    }
  }
}
