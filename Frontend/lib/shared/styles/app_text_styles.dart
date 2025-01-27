import 'package:flutter/material.dart';

class AppTextStyles {
  // Headings (H1 to H6)
  static const TextStyle h1 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    height: 1.5,
    color: Colors.black,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
    height: 1.4,
    color: Colors.black,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: Colors.black,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: Colors.black,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: Colors.black,
  );

  static const TextStyle h6 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    height: 1.1,
    color: Colors.black,
  );

  // Subtitles
  static const TextStyle subtitle1 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: Colors.black87,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: Colors.black87,
  );

  // Body Text
  static const TextStyle bodyText1 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    height: 1.5,
    color: Colors.black,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    height: 1.4,
    color: Colors.black87,
  );

  // Buttons
  static const TextStyle button = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.25,
    color: Colors.white,
  );

  // Captions
  static const TextStyle caption = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    height: 1.2,
    color: Colors.black54,
  );

  // Overlines (Small text)
  static const TextStyle overline = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: Colors.black54,
  );

  // Error Text
  static const TextStyle errorText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.red,
  );

  // Custom Style (Dynamic Color and Size)
  static TextStyle custom({
    required String fontFamily,
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double height = 1.2,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
