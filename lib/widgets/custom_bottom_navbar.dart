import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pilih_film/themes/theme.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavbar({
    this.selectedIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: Colors.white,
      ),
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              height: 32,
              width: 32,
              child: Icon(
                MdiIcons.home,
                size: 32,
                color:
                    (selectedIndex == 0) ? secondaryColor : Color(0xFFBEBEBE),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              height: 32,
              width: 32,
              child: Icon(
                Icons.play_circle_fill,
                size: 32,
                color:
                    (selectedIndex == 1) ? secondaryColor : Color(0xFFBEBEBE),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
