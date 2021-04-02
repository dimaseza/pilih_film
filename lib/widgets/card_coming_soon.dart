import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/shared/shared.dart';
import 'package:pilih_film/themes/theme.dart';

class CardComingSoon extends StatelessWidget {
  final Movie movie;

  CardComingSoon(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageBaseURL + "w500" + movie.posterPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 260,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  DateFormat('d MMM y')
                      .format(DateTime.parse(movie.releaseDate)),
                  style: subtitleFontStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFE4E4E4),
                  ),
                ),
                Text(
                  movie.title,
                  style: titleFontStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
