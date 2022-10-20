library app_theme;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

part 'app_colors.dart';

part 'app_style.dart';

part 'app_text_styles.dart';

final kLightThemeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: skyBlue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: skyBlue,
  hintColor: Colors.grey,
  dividerTheme: const DividerThemeData(space: 1),
  scaffoldBackgroundColor: skyBlue[50],
  primaryTextTheme: const TextTheme(
    subtitle1: TextStyle(
      color: skyBlue,
      fontSize: 12,
    ),
  ),
  appBarTheme: _kAppBarTheme.copyWith(
    color: skyBlue[50],
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
);

final kDarkThemeData = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: skyBlue[700],
  scaffoldBackgroundColor: Colors.grey[700],
  toggleableActiveColor: skyBlue,
  primaryTextTheme: const TextTheme(
    subtitle1: TextStyle(
      color: skyBlue,
      fontSize: 12,
    ),
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    primary: skyBlue[400],
  ),
  appBarTheme: _kAppBarTheme.copyWith(
    color: skyBlue[50],
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
);

const _kAppBarTheme = AppBarTheme(
  centerTitle: true,
);
