import 'package:flutter/material.dart';
import 'package:pilih_film/models/movie_genre.dart';
import 'package:pilih_film/themes/theme.dart';

class TabBarGenre extends StatelessWidget {
  final List<MovieGenre> genres;
  final int selectedIndex;
  final Function(int) onTap;

  TabBarGenre({
    @required this.genres,
    this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: genres
            .map(
              (tab) => Padding(
                padding: EdgeInsets.only(left: 24),
                child: GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap(genres.indexOf(tab));
                    }
                  },
                  child: Text(
                    tab.name,
                    style: (genres.indexOf(tab) == selectedIndex
                        ? titleFontStyle.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )
                        : subtitleFontStyle.copyWith(
                            fontSize: 20,
                            color: secondaryColor,
                          )),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
