import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/services/services.dart';

part 'coming_soon_state.dart';

class ComingSoonCubit extends Cubit<ComingSoonState> {
  ComingSoonCubit() : super(ComingSoonInitial());

  Future<void> getComingSoon() async {
    ApiReturnValue<List<Movie>> result =
        await MovieServices.getComingSoonMovies();

    print(result.value);

    if (result.value != null) {
      emit(ComingSoonLoaded(result.value));
    } else {
      emit(ComingSoonLoadingFailed(result.message));
    }
  }
}
