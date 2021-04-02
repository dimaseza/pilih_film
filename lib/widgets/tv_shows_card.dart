import 'package:flutter/material.dart';
import 'package:pilih_film/models/tv/tv_models.dart';
import 'package:pilih_film/shared/shared.dart';
import 'package:pilih_film/themes/theme.dart';
import 'package:pilih_film/widgets/rating_stars.dart';

class TvShowsCard extends StatelessWidget {
  final TVShows tvShows;

  TvShowsCard(this.tvShows);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: semiBlackColor,
              image: DecorationImage(
                image: NetworkImage(imageBaseURL + "w500" + tvShows.posterPath),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Text(
            tvShows.name,
            style: titleFontStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          RatingStars(
            voteAverage: tvShows.voteAverage,
          ),
        ],
      ),
    );
  }
}
