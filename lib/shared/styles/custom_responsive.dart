import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  // Screen dimensions
  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  // Responsive width
  double width(double percentage) {
    return screenWidth * (percentage / 100);
  }

  // Responsive height
  double height(double percentage) {
    return screenHeight * (percentage / 100);
  }

  // Responsive font size
  double fontSize(double percentage) {
    // Based on the smaller of width or height
    return (screenWidth < screenHeight ? screenWidth : screenHeight) * (percentage / 100);
  }

  // Custom breakpoint helpers
  bool isMobile() => screenWidth < 600;
  bool isTablet() => screenWidth >= 600 && screenWidth < 1024;
  bool isDesktop() => screenWidth >= 1024;
}
