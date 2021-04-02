import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pilih_film/cubit/tv/cubit/on_the_air_cubit.dart';
import 'package:pilih_film/cubit/tv/cubit/tv_shows_cubit.dart';
import 'package:pilih_film/cubit/tv/cubit/tv_shows_genre_cubit.dart';
import 'package:pilih_film/cubit/tv/cubit/tv_shows_trending_cubit.dart';
import 'package:pilih_film/models/tv/tv_models.dart';
import 'package:pilih_film/models/tv/tv_shows_genre.dart';
import 'package:pilih_film/pages/tv_shows_detail_page.dart';
import 'package:pilih_film/shared/shared.dart';
import 'package:pilih_film/themes/theme.dart';
import 'package:pilih_film/widgets/widgets.dart';

class TvShowsViews extends StatefulWidget {
  @override
  _TvShowsViewsState createState() => _TvShowsViewsState();
}

class _TvShowsViewsState extends State<TvShowsViews> {
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
            'On The Air',
            style: titleFontStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Container(
          height: 260,
          child: BlocBuilder<OnTheAirCubit, OnTheAirState>(
            builder: (_, state) {
              if (state is OnTheAirLoaded) {
                List<TVShows> tvShows = state.tvShows.sublist(0, 10);

                return ScrollConfiguration(
                  behavior: ScrollBehavior()
                    ..buildViewportChrome(
                      context,
                      null,
                      AxisDirection.left,
                    ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tvShows.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                        left: (index == 0) ? 24 : 0,
                        right: (index == tvShows.length - 1) ? 24 : 16,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            TvShowsDetailPage(
                              tvShows: tvShows[index],
                              onBackPressed: () {
                                Get.back();
                              },
                            ),
                          );
                        },
                        child: CardOnTheAir(
                          tvShows[index],
                        ),
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
            bottom: 16,
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
        Container(
          height: 210,
          child: BlocBuilder<TvShowsTrendingCubit, TvShowsTrendingState>(
            builder: (_, state) {
              if (state is TvShowsTrendingLoaded) {
                List<TVShows> tvShows = state.tvShows.sublist(0, 10);

                return ScrollConfiguration(
                  behavior: ScrollBehavior()
                    ..buildViewportChrome(
                      context,
                      null,
                      AxisDirection.left,
                    ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tvShows.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                        left: (index == 0) ? 24 : 0,
                        right: (index == tvShows.length - 1) ? 24 : 16,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            TvShowsDetailPage(
                              tvShows: tvShows[index],
                              onBackPressed: () {
                                Get.back();
                              },
                            ),
                          );
                        },
                        child: TvShowsCard(tvShows[index]),
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
          child: BlocBuilder<TvShowsGenreCubit, TvShowsGenreState>(
            builder: (_, state) {
              if (state is TvShowsGenreLoaded) {
                List<TvShowsGenre> genres = state.tvShowsGenre;

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
                              TabBarGenreTvShows(
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
                      child: BlocBuilder<TvShowsCubit, TvShowsState>(
                        builder: (_, state) {
                          if (state is TvShowsLoaded) {
                            List<TVShows> tvShows = state.tvShows
                                .where((tv) => tv.genre
                                    .contains(genres[selectedIndexGenre].id))
                                .toList();
                            if (tvShows.length == 0) {
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
                                    "No tv shows in this genre",
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
                                children: tvShows
                                    .map(
                                      (tv) => Container(
                                        margin: EdgeInsets.only(
                                          left: 24,
                                          right: 24,
                                          bottom: 12,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(
                                              TvShowsDetailPage(
                                                tvShows: tv,
                                                onBackPressed: () {
                                                  Get.back();
                                                },
                                              ),
                                            );
                                          },
                                          child: CardGenreTvShows(tv),
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
