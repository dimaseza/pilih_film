import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/models/tv/tv_shows.dart';
import 'package:pilih_film/services/services.dart';

part 'tv_shows_state.dart';

class TvShowsCubit extends Cubit<TvShowsState> {
  TvShowsCubit() : super(TvShowsInitial());

  Future<void> getTvShows() async {
    ApiReturnValue<List<TVShows>> result =
        await TvShowsServices.getAllTvShows(1);

    if (result.value != null) {
      emit(TvShowsLoaded(result.value));
    } else {
      emit(TvShowsLoadingFailed(result.message));
    }
  }
}
