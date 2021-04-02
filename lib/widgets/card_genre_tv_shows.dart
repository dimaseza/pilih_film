import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pilih_film/models/tv/tv_models.dart';
import 'package:pilih_film/shared/shared.dart';
import 'package:pilih_film/themes/theme.dart';
import 'package:pilih_film/widgets/widgets.dart';
import 'package:intl/date_symbol_data_local.dart';

class CardGenreTvShows extends StatefulWidget {
  final TVShows tvShows;

  CardGenreTvShows(this.tvShows);

  @override
  _CardGenreTvShowsState createState() => _CardGenreTvShowsState();
}

class _CardGenreTvShowsState extends State<CardGenreTvShows> {
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
                    imageBaseURL + "w500" + widget.tvShows.posterPath),
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
                  widget.tvShows.name,
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
                  widget.tvShows.overview,
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
                      voteAverage: widget.tvShows.voteAverage,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${widget.tvShows.voteAverage}",
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
                  DateTime.parse(widget.tvShows.firstAirDate),
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
