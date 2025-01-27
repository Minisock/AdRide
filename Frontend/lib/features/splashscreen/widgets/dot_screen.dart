import 'package:app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DotScreen extends StatelessWidget {
  const DotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: AppColors().primaryColor, // Yellow color
        shape: BoxShape.circle,
      ),
    );
  }
}
