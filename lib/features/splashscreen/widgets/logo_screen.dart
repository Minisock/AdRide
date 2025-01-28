
import 'package:app/core/constants/icons.dart';
import 'package:app/shared/widgets/icons/custom_icon.dart';
import 'package:flutter/material.dart';

class AppLogoScreen extends StatelessWidget {
  const AppLogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomIcon(svgPath: AppIcons.appIcon));
  }
}
