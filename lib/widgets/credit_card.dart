import 'package:flutter/material.dart';
import 'package:pilih_film/models/models.dart';
import 'package:pilih_film/shared/shared.dart';
import 'package:pilih_film/themes/theme.dart';

class CreditCard extends StatelessWidget {
  final Credit credit;

  CreditCard(this.credit);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 80,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blueGrey[800],
            image: (credit.profilePath == null)
                ? DecorationImage(
                    image: AssetImage('assets/not_found.png'),
                    fit: BoxFit.cover,
                  )
                : DecorationImage(
                    image: NetworkImage(
                        imageBaseURL + "w185" + credit.profilePath),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 6),
          width: 70,
          child: Text(
            credit.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: titleFontStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
