import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/models/tv/tv_shows_genre.dart';
import 'package:pilih_film/services/services.dart';

part 'tv_shows_genre_state.dart';

class TvShowsGenreCubit extends Cubit<TvShowsGenreState> {
  TvShowsGenreCubit() : super(TvShowsGenreInitial());

  Future<void> getGenreTv() async {
    ApiReturnValue<List<TvShowsGenre>> result =
        await TvShowsServices.getListGenre();

    if (result.value != null) {
      emit(TvShowsGenreLoaded(result.value));
    } else {
      emit(TvShowsGenreLoadingFailed(result.message));
    }
  }
}
