import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/services/services.dart';

part 'genre_movie_state.dart';

class GenreMovieCubit extends Cubit<GenreMovieState> {
  GenreMovieCubit() : super(GenreMovieInitial());

  Future<void> getGenre() async {
    ApiReturnValue<List<MovieGenre>> result =
        await MovieServices.getListGenre();

    print(result.value);

    if (result.value != null) {
      emit(GenreMovieLoaded(result.value));
    } else {
      emit(GenreMovieLoadingFailed(result.message));
    }
  }
}
