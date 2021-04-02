import 'package:flutter/material.dart';
import 'package:pilih_film/pages/pages.dart';
import 'package:pilih_film/themes/theme.dart';
import 'package:pilih_film/widgets/custom_bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  final int initialPage;

  MainPage({this.initialPage});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  SharedPreferences loginData;
  String fullname;

  @override
  void initState() {
    super.initState();
    initial();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
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
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Center(
                  child: HomePage(),
                ),
                Center(
                  child: FavoritePage(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavbar(
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
