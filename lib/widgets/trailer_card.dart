import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/shared/shared.dart';
import 'package:pilih_film/themes/theme.dart';

class TrailerCard extends StatelessWidget {
  final Movie movie;

  TrailerCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageBaseURL + 'w500' + movie.backdropPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: titleFontStyle.copyWith(
                  fontSize: 20,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Release Date: ',
                    style: subtitleFontStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${DateFormat('d MMM y').format(DateTime.parse(movie.releaseDate))}',
                    style: subtitleFontStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
