import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pilih_film/themes/theme.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;

  RatingStars({
    this.voteAverage = 0,
  });

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widgets = List.generate(
      5,
      (index) => Icon(
        index < n ? MdiIcons.star : MdiIcons.starOutline,
        color: semiBlackColor,
        size: 20,
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widgets,
    );
  }
}
