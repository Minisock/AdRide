import 'package:app/shared/resources/enums/button_styles.dart';
import 'package:app/shared/widgets/icons/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final IconData? iconData;
  final String? svgPath;
  final VoidCallback onPressed;
  final ButtonType type;
  final double size;
  final Color? backgroundColor;

  const CustomFloatingActionButton({
    this.iconData,
    this.svgPath,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.size = 24.0,
    this.backgroundColor,
    super.key,
  });

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;
    switch (type) {
      case ButtonType.secondary:
        return Colors.grey;
      case ButtonType.tertiary:
        return Colors.lightBlueAccent;
      case ButtonType.error:
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: _getBackgroundColor(),
      child: svgPath != null
          ? CustomIcon(svgPath: svgPath!, size: size,)
          : Icon(iconData, size: size, color: Colors.white),
    );
  }
}
