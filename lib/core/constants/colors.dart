import 'package:flutter/material.dart';

abstract class Colorgraphy {
  Color get primaryColor;
  Color get secondaryColor;
  Color get primaryLight;
  Color get primaryDark;
  Color get activeGreen;
  Color get cancelRed;
  Color get textColor;
  Color get backgroundColor;
  Color get cardBackground;
}

class AppColors implements Colorgraphy {
  @override
  Color get primaryColor => const Color(0xFFFFE082);

  @override
  Color get secondaryColor =>const Color.fromARGB(255, 254, 214, 94);

  // Primary colors
  @override
  Color get primaryLight => const Color(0xFFFFCC33);

  @override
  Color get primaryDark => const Color(0xFF664300);

  // Status Colors
  @override
  Color get activeGreen => const Color(0xFF4CAF50);

  Color get activeYellow => const Color.fromARGB(255, 254, 214, 94);

  @override
  Color get cancelRed => const Color(0xFFF44336);


  @override
  Color get blackbutton => Colors.black;

  // Text Colors
  @override
  Color get textColor => Colors.black87;

  @override
  Color get backgroundColor => Colors.white;

  // Additional colors
  @override
  Color get cardBackground => Colors.white;
}
