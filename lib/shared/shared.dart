import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pilih_film/themes/theme.dart';

String apiKey = "a25193200db56dec1b59eeedadb0b6be";
String imageBaseURL = "https://image.tmdb.org/t/p/";

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: semiBlackColor,
);
