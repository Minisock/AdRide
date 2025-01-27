import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String svgPath;
  final double size;

  const CustomIcon({
    required this.svgPath,
    this.size = 24.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      width: size,
      height: size,
    );
  }
}
