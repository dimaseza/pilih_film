import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/services/movie_services.dart';

part 'movie_trending_state.dart';

class MovieTrendingCubit extends Cubit<MovieTrendingState> {
  MovieTrendingCubit() : super(MovieTrendingInitial());

  Future<void> getTrendingMovies() async {
    ApiReturnValue<List<Movie>> result =
        await MovieServices.getTrendingMovies();

    print(result.value);
    if (result.value != null) {
      emit(MovieTrendingLoaded(result.value));
    } else {
      emit(MovieTrendingLoadingFailed(result.message));
    }
  }
}
