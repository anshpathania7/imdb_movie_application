import 'package:flutter/material.dart';
import 'package:imdb_movie_application/colors.dart';

class Themes {
  static final mainTheme = ThemeData(
    // Colors
    backgroundColor: kDarkBlue,
    primaryColor: Colors.white,
    splashColor: kLightBlue,
    cardColor: kLightBlue,
    hoverColor: kLightBlue,
    highlightColor: kLightBlue,
    colorScheme:
        ColorScheme.light(primary: Colors.white, secondary: kLightBlue),

    // Fonts
    fontFamily: 'Montserrat',
  );
}
