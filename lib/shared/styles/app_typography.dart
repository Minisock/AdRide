import 'package:flutter/material.dart';

abstract class AppTypography {
  // Headline styles
  static const TextStyle headline1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: Colors.black,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    color: Colors.black,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    color: Colors.black,
  );

  // Subtitle styles
  static const TextStyle subtitle1 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    color: Colors.grey,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    color: Colors.grey,
  );

  // Body styles
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: Colors.black,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: Colors.black,
  );

  // Caption and overline
  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w300,
    fontFamily: 'Roboto',
    color: Colors.grey,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w300,
    fontFamily: 'Roboto',
    color: Colors.grey,
    letterSpacing: 1.5,
  );

  // Button styles
  static const TextStyle button = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: Colors.white,
    letterSpacing: 1.25,
  );

  // Dynamic Custom TextStyle Method
  static TextStyle custom({
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = 'Roboto',
    Color color = Colors.black,
    double letterSpacing = 0.0,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      color: color,
      letterSpacing: letterSpacing,
    );
  }
}
