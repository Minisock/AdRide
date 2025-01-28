abstract class Dimensions {
  // Padding values
  static const double paddingExtraSmall = 4.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingExtraLarge = 32.0;

  // Margin values
  static const double marginExtraSmall = 4.0;
  static const double marginSmall = 8.0;
  static const double marginMedium = 16.0;
  static const double marginLarge = 24.0;
  static const double marginExtraLarge = 32.0;

  // Font sizes
  static const double fontExtraSmall = 10.0;
  static const double fontSmall = 12.0;
  static const double fontMedium = 14.0;
  static const double fontLarge = 18.0;
  static const double fontExtraLarge = 24.0;
  static const double fontTitle = 32.0;

  // Border radius
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusExtraLarge = 24.0;

  // Icon sizes
  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;
  static const double iconExtraLarge = 48.0;

  // Heights and widths
  static const double heightSmall = 40.0;
  static const double heightMedium = 80.0;
  static const double heightLarge = 120.0;

  static const double widthSmall = 40.0;
  static const double widthMedium = 80.0;
  static const double widthLarge = 120.0;

  // Elevation (shadow depth)
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;

  // Dynamic scaling for responsiveness (example method)
  static double dynamicWidth(double percentage, double screenWidth) =>
      percentage * screenWidth;

  static double dynamicHeight(double percentage, double screenHeight) =>
      percentage * screenHeight;

  // Spacing between widgets
  static const double spacingExtraSmall = 4.0;
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
  static const double spacingExtraLarge = 32.0;

  // Line heights
  static const double lineHeightSmall = 1.2;
  static const double lineHeightMedium = 1.5;
  static const double lineHeightLarge = 1.8;

  // Custom dimension handling
  static double customValue(double scale, double baseValue) =>
      scale * baseValue;
}
