import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pilih_film/cubit/coming_soon_cubit.dart';
import 'package:pilih_film/cubit/genre_movie_cubit.dart';
import 'package:pilih_film/cubit/movie_cubit.dart';
import 'package:pilih_film/cubit/movie_trending_cubit.dart';
import 'package:pilih_film/cubit/top_rated_movie_cubit.dart';
import 'package:pilih_film/cubit/tv/cubit/on_the_air_cubit.dart';
import 'package:pilih_film/cubit/tv/cubit/tv_shows_cubit.dart';
import 'package:pilih_film/cubit/tv/cubit/tv_shows_genre_cubit.dart';
import 'package:pilih_film/cubit/tv/cubit/tv_shows_trending_cubit.dart';
import 'package:pilih_film/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieCubit(),
        ),
        BlocProvider(
          create: (context) => MovieTrendingCubit(),
        ),
        BlocProvider(
          create: (context) => ComingSoonCubit(),
        ),
        BlocProvider(
          create: (context) => TopRatedMovieCubit(),
        ),
        BlocProvider(
          create: (context) => GenreMovieCubit(),
        ),
        BlocProvider(
          create: (context) => TvShowsCubit(),
        ),
        BlocProvider(
          create: (context) => OnTheAirCubit(),
        ),
        BlocProvider(
          create: (context) => TvShowsTrendingCubit(),
        ),
        BlocProvider(
          create: (context) => TvShowsGenreCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: NamePage(),
      ),
    );
  }
}
