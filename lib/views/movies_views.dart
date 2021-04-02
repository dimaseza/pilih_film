import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pilih_film/cubit/coming_soon_cubit.dart';
import 'package:pilih_film/cubit/genre_movie_cubit.dart';
import 'package:pilih_film/cubit/movie_cubit.dart';
import 'package:pilih_film/cubit/movie_trending_cubit.dart';
import 'package:pilih_film/cubit/top_rated_movie_cubit.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/pages/pages.dart';
import 'package:pilih_film/shared/shared.dart';
import 'package:pilih_film/themes/theme.dart';
import 'package:pilih_film/widgets/card_genre_movie.dart';
import 'package:pilih_film/widgets/tab_bar_genre.dart';
import 'package:pilih_film/widgets/widgets.dart';

class MoviesViews extends StatefulWidget {
  @override
  _MoviesViewsState createState() => _MoviesViewsState();
}

class _MoviesViewsState extends State<MoviesViews> {
  int selectedIndexGenre = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 24,
            bottom: 16,
          ),
          child: Text(
            'Coming Soon',
            style: titleFontStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Container(
          height: 260,
          child: BlocBuilder<ComingSoonCubit, ComingSoonState>(
            builder: (_, state) {
              if (state is ComingSoonLoaded) {
                List<Movie> movies = state.movie.sublist(0, 10);

                return ScrollConfiguration(
                  behavior: ScrollBehavior()
                    ..buildViewportChrome(
                      context,
                      null,
                      AxisDirection.left,
                    ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                        left: (index == 0) ? 24 : 0,
                        right: (index == movies.length - 1) ? 24 : 16,
                      ),
                      child: CardComingSoon(
                        movies[index],
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: loadingIndicator,
                );
              }
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(
            left: 24,
          ),
          child: Text(
            'Trending',
            style: titleFontStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 210,
          child: BlocBuilder<MovieTrendingCubit, MovieTrendingState>(
            builder: (_, state) {
              if (state is MovieTrendingLoaded) {
                List<Movie> movies = state.movie.sublist(0, 10);

                return ScrollConfiguration(
                  behavior: ScrollBehavior()
                    ..buildViewportChrome(
                      context,
                      null,
                      AxisDirection.left,
                    ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                        left: (index == 0) ? 24 : 0,
                        right: (index == movies.length - 1) ? 24 : 16,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            MovieDetailPage(
                              movie: movies[index],
                              onBackPressed: () {
                                Get.back();
                              },
                            ),
                          );
                        },
                        child: MovieCard(movies[index]),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: loadingIndicator,
                );
              }
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 24, bottom: 16),
          child: Text(
            'Top Rated',
            style: titleFontStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Container(
          height: 210,
          child: BlocBuilder<TopRatedMovieCubit, TopRatedMovieState>(
            builder: (_, state) {
              if (state is TopRatedMovieLoaded) {
                List<Movie> movies = state.movie.sublist(0, 10);

                return ScrollConfiguration(
                  behavior: ScrollBehavior()
                    ..buildViewportChrome(context, null, AxisDirection.right),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                        left: (index == 0) ? 24 : 0,
                        right: (index == movies.length - 1) ? 24 : 16,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            MovieDetailPage(
                              movie: movies[index],
                              onBackPressed: () {
                                Get.back();
                              },
                            ),
                          );
                        },
                        child: MovieCard(movies[index]),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: loadingIndicator,
                );
              }
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 24, bottom: 16),
          child: Text(
            'Genre',
            style: titleFontStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Container(
          child: BlocBuilder<GenreMovieCubit, GenreMovieState>(
            builder: (_, state) {
              if (state is GenreMovieLoaded) {
                List<MovieGenre> genres = state.genre;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (_, index) => Container(
                          margin: EdgeInsets.only(
                            left: (index == 0) ? 0 : 0,
                            right: (index == genres.length - 1) ? 24 : 16,
                          ),
                          child: Column(
                            children: [
                              TabBarGenre(
                                genres: genres,
                                selectedIndex: selectedIndexGenre,
                                onTap: (index) async {
                                  setState(() {
                                    selectedIndexGenre = index;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      child: BlocBuilder<MovieCubit, MovieState>(
                        builder: (_, state) {
                          if (state is MovieLoaded) {
                            List<Movie> movies = state.movie
                                .where((mov) => mov.genreId
                                    .contains(genres[selectedIndexGenre].id))
                                .toList();
                            if (movies.length == 0) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/no_movie.gif'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "No movies in this genre",
                                    style: titleFontStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: movies
                                    .map(
                                      (movie) => Container(
                                        margin: EdgeInsets.only(
                                          left: 24,
                                          right: 24,
                                          bottom: 12,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(
                                              MovieDetailPage(
                                                movie: movie,
                                                onBackPressed: () {
                                                  Get.back();
                                                },
                                              ),
                                            );
                                          },
                                          child: CardGenreMovie(movie),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            }
                          } else {
                            return Center(
                              child: loadingIndicator,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: loadingIndicator,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
