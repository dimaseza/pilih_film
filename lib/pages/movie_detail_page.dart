import 'package:flutter/material.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/services/services.dart';
import 'package:pilih_film/shared/shared.dart';
import 'package:pilih_film/themes/theme.dart';
import 'package:pilih_film/widgets/rating_stars.dart';
import 'package:pilih_film/widgets/widgets.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;
  final Function onBackPressed;

  MovieDetailPage({
    this.movie,
    this.onBackPressed,
  });

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    MovieDetail movieDetail;
    List<Credit> credits;

    return Scaffold(
      backgroundColor: whiteSemiColor,
      body: Stack(
        children: [
          Container(
            color: whiteSemiColor,
          ),
          SafeArea(
            child: Container(
              color: whiteSemiColor,
            ),
          ),
          ScrollConfiguration(
            behavior: ScrollBehavior()
              ..buildViewportChrome(
                context,
                null,
                AxisDirection.up,
              ),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder(
                      future: MovieServices.getDetails(widget.movie),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          movieDetail = snapshot.data;
                        }
                        return Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 500,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(imageBaseURL +
                                          'w1280' +
                                          widget.movie.backdropPath ??
                                      widget.movie.posterPath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 100,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (widget.onBackPressed != null) {
                                          widget.onBackPressed();
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.black12,
                                        ),
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: whiteSemiColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                    top: 300,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: whiteSemiColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          RatingStars(
                                              voteAverage:
                                                  widget.movie.voteAverage),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "${widget.movie.voteAverage}",
                                            style: titleFontStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        widget.movie.title,
                                        style: titleFontStyle.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.6,
                                        ),
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      (snapshot.hasData)
                                          ? Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      5,
                                                  child: Text(
                                                    movieDetail.genresMovie,
                                                    style: subtitleFontStyle
                                                        .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                (movieDetail.language == null)
                                                    ? SizedBox.shrink()
                                                    : Container(
                                                        child: Text(
                                                          movieDetail
                                                              .languageMovie,
                                                          style:
                                                              subtitleFontStyle
                                                                  .copyWith(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            )
                                          : loadingIndicator,
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Description",
                                        style: titleFontStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        widget.movie.overview,
                                        style: titleFontStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.7,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Cast",
                                        style: titleFontStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      FutureBuilder(
                                        future: MovieServices.getCredits(
                                            widget.movie.id),
                                        builder: (_, snapshot) {
                                          if (snapshot.hasData) {
                                            credits = snapshot.data;

                                            return SizedBox(
                                              height: 150,
                                              child: ScrollConfiguration(
                                                behavior: ScrollBehavior()
                                                  ..buildViewportChrome(
                                                    context,
                                                    null,
                                                    AxisDirection.right,
                                                  ),
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: credits.length,
                                                  itemBuilder: (_, index) =>
                                                      Container(
                                                    margin: EdgeInsets.only(
                                                        right: (index ==
                                                                credits.length -
                                                                    1)
                                                            ? 24
                                                            : 8),
                                                    child: CreditCard(
                                                        credits[index]),
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return loadingIndicator;
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     width: double.infinity,
          //     height: 45,
          //     margin: EdgeInsets.only(
          //       left: 24,
          //       right: 24,
          //       bottom: 20,
          //     ),
          //     child: RaisedButton(
          //       onPressed: () {},
          //       color: semiBlackColor,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //       child: Text(
          //         "Watch Trailer",
          //         style: subtitleFontStyle.copyWith(
          //           fontSize: 16,
          //           fontWeight: FontWeight.w600,
          //           color: whiteSemiColor,
          //           letterSpacing: 1,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
