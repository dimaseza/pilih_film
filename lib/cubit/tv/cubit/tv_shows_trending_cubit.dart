import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/models/tv/tv_models.dart';
import 'package:pilih_film/services/services.dart';

part 'tv_shows_trending_state.dart';

class TvShowsTrendingCubit extends Cubit<TvShowsTrendingState> {
  TvShowsTrendingCubit() : super(TvShowsTrendingInitial());

  Future<void> getTrendingTv() async {
    ApiReturnValue<List<TVShows>> result =
        await TvShowsServices.getTrendingTvShows();

    if (result.value != null) {
      emit(TvShowsTrendingLoaded(result.value));
    } else {
      emit(TvShowsTrendingLoadingFailed(result.message));
    }
  }
}
