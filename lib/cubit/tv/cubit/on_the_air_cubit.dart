import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pilih_film/models/api_return_value.dart';
import 'package:pilih_film/models/tv/tv_models.dart';
import 'package:pilih_film/services/services.dart';

part 'on_the_air_state.dart';

class OnTheAirCubit extends Cubit<OnTheAirState> {
  OnTheAirCubit() : super(OnTheAirInitial());

  Future<void> getOnTheAir() async {
    ApiReturnValue<List<TVShows>> result = await TvShowsServices.getOnTheAir();

    if (result.value != null) {
      emit(OnTheAirLoaded(result.value));
    } else {
      emit(OnTheAirLoadingFailed(result.message));
    }
  }
}
