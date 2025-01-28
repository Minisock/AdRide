import 'package:app/core/constants/colors.dart';
import 'package:app/shared/resources/enums/button_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonType type;
  final double borderRadius;
  final EdgeInsets padding;
  final TextStyle? textStyle;

  const CustomElevatedButton({super.key,
    required this.label,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.textStyle,
  });

  Color _getBackgroundColor() {
    switch (type) {
      case ButtonType.secondary:
        return AppColors().secondaryColor;
      case ButtonType.tertiary:
        return Colors.lightBlueAccent;
      case ButtonType.error:
        return Colors.red;
      default:
        return AppColors().primaryColor;
    }
  }

  Color _getTextColor() {
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _getBackgroundColor(),
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        label,
        style: textStyle ?? TextStyle(color: _getTextColor(), fontSize: 16.0),
      ),
    );
  }
}
