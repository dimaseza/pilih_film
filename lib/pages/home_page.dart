import 'package:flutter/material.dart';
import 'package:pilih_film/themes/theme.dart';
import 'package:pilih_film/views/movies_views.dart';
import 'package:pilih_film/views/tv_shows_views.dart';
import 'package:pilih_film/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  SharedPreferences loginData;
  String fullname;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      fullname = loginData.getString('fullname');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: whiteSemiColor,
          ),
          SafeArea(
            child: ScrollConfiguration(
              behavior: ScrollBehavior()
                ..buildViewportChrome(
                  context,
                  null,
                  AxisDirection.up,
                ),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // HEADER
                      Container(
                        margin: EdgeInsets.only(
                          left: 24,
                          top: 40,
                          bottom: 26,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome",
                              style: titleFontStyle.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "$fullname",
                              style: subtitleFontStyle.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // TAB BAR MOVIES & TV SHOWS
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTabbar(
                              titles: ['Movies', 'TV Shows'],
                              selectedIndex: selectedIndex,
                              onTap: (index) {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            (selectedIndex == 0)
                                ? MoviesViews()
                                : TvShowsViews()
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
