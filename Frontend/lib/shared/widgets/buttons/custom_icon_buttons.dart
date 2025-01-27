import 'package:app/shared/resources/enums/button_styles.dart';
import 'package:app/shared/widgets/icons/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? iconData;
  final String? svgPath;
  final VoidCallback onPressed;
  final ButtonType type;
  final double size;
  final EdgeInsets padding;

  const CustomIconButton({
    this.iconData,
    this.svgPath,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.size = 24.0,
    this.padding = const EdgeInsets.all(8.0),
    super.key,
  });

  Color _getIconColor() {
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
    return IconButton(
      onPressed: onPressed,
      padding: padding,
      icon: svgPath != null
          ? CustomIcon(svgPath: svgPath!, size: size)
          : Icon(iconData, size: size, color: _getIconColor()),
    );
  }
}
