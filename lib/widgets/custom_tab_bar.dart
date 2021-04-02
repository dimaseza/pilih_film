import 'package:flutter/material.dart';
import 'package:pilih_film/themes/theme.dart';

class CustomTabbar extends StatelessWidget {
  final List<String> titles;
  final int selectedIndex;
  final Function(int) onTap;

  CustomTabbar({
    @required this.titles,
    this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: titles
            .map(
              (tab) => Padding(
                padding: EdgeInsets.only(left: 24),
                child: GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap(titles.indexOf(tab));
                    }
                  },
                  child: Text(
                    tab,
                    style: (titles.indexOf(tab) == selectedIndex
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
