import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SVG Test")),
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/appIcon.svg',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}