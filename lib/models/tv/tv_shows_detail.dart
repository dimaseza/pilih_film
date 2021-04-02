import 'package:pilih_film/models/tv/tv_models.dart';

class TvShowsDetail extends TVShows {
  final List<String> genres;
  final String languages;

  TvShowsDetail(TVShows tvShows, {this.genres, this.languages})
      : super(
          id: tvShows.id,
          name: tvShows.name,
          backdropPath: tvShows.backdropPath,
          firstAirDate: tvShows.firstAirDate,
          genre: tvShows.genre,
          overview: tvShows.overview,
          posterPath: tvShows.posterPath,
          voteAverage: tvShows.voteAverage,
        );

  String get genresTvShows {
    String s = "";

    for (var genre in genres) {
      s += genre + (genre != genres.last ? ', ' : '');
    }

    return s;
  }

  String get languageTvShows {
    return languages;
  }

  @override
  List<Object> get props => super.props + [genres, languages];
}
