import 'package:flutter/material.dart';
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
import 'package:pilih_film/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NamePage extends StatefulWidget {
  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  TextEditingController userController = TextEditingController();

  SharedPreferences loginData;
  bool newName;

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  isLogin() async {
    loginData = await SharedPreferences.getInstance();
    newName = (loginData.getBool('name') ?? true);

    if (newName == false) {
      context.read<MovieCubit>().getMovies();
      context.read<MovieTrendingCubit>().getTrendingMovies();
      context.read<ComingSoonCubit>().getComingSoon();
      context.read<TopRatedMovieCubit>().getTopRatedMovies();
      context.read<GenreMovieCubit>().getGenre();
      context.read<TvShowsCubit>().getTvShows();
      context.read<OnTheAirCubit>().getOnTheAir();
      context.read<TvShowsTrendingCubit>().getTrendingTv();
      context.read<TvShowsGenreCubit>().getGenreTv();
      Get.offAll(HomePage());
    }
  }

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 20, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "What's your name?",
                        style: titleFontStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 44,
                        child: TextField(
                          controller: userController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: secondaryColor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: semiBlackColor,
                              ),
                            ),
                            hintText: "John",
                            hintStyle: subtitleFontStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          style: titleFontStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 44,
                child: RaisedButton(
                  onPressed: () {
                    String fullname = userController.text;

                    if (fullname != '') {
                      context.read<MovieCubit>().getMovies();
                      context.read<MovieTrendingCubit>().getTrendingMovies();
                      context.read<ComingSoonCubit>().getComingSoon();
                      context.read<TopRatedMovieCubit>().getTopRatedMovies();
                      context.read<GenreMovieCubit>().getGenre();
                      context.read<TvShowsCubit>().getTvShows();
                      context.read<OnTheAirCubit>().getOnTheAir();
                      context.read<TvShowsTrendingCubit>().getTrendingTv();
                      context.read<TvShowsGenreCubit>().getGenreTv();
                      loginData.setBool('name', false);

                      loginData.setString('fullname', fullname);

                      Get.offAll(HomePage());
                    }
                  },
                  color: secondaryColor,
                  child: Text(
                    "Bring Me In",
                    style: titleFontStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
