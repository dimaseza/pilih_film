import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/services/movie_services.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  Future<void> getMovies() async {
    ApiReturnValue<List<Movie>> result = await MovieServices.getAllMovies(2);

    // print(result.value.toString);
    if (result.value != null) {
      emit(MovieLoaded(result.value));
    } else {
      emit(MovieLoadingFailed(result.message));
    }
  }
}
