import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/shared/shared.dart';
import 'package:pilih_film/themes/theme.dart';
import 'package:pilih_film/widgets/widgets.dart';
import 'package:intl/date_symbol_data_local.dart';

class CardGenreMovie extends StatefulWidget {
  final Movie movie;

  CardGenreMovie(this.movie);

  @override
  _CardGenreMovieState createState() => _CardGenreMovieState();
}

class _CardGenreMovieState extends State<CardGenreMovie> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: NetworkImage(
                    imageBaseURL + "w500" + widget.movie.posterPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 180,
                child: Text(
                  widget.movie.title,
                  style: titleFontStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 180,
                child: Text(
                  widget.movie.overview,
                  style: subtitleFontStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 180,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RatingStars(
                      voteAverage: widget.movie.voteAverage,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${widget.movie.voteAverage}",
                      style: titleFontStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                DateFormat('d MMM yyyy', 'id').format(
                  DateTime.parse(widget.movie.releaseDate),
                ),
                style: titleFontStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
