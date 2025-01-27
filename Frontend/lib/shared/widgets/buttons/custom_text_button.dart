import 'package:app/shared/resources/enums/button_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButtonWithRichText extends StatelessWidget {
  final String text;
  final String richTextPart;
  final VoidCallback onPressed;
  final ButtonType type;
  final TextStyle? textStyle;
  final TextStyle? richTextStyle;

  const CustomTextButtonWithRichText({
    super.key,
    required this.text,
    required this.richTextPart,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.textStyle,
    this.richTextStyle,
  });

  Color _getTextColor() {
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
    return TextButton(
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: textStyle ??
                  TextStyle(color: _getTextColor(), fontSize: 14.0),
            ),
            TextSpan(
              text: richTextPart,
              style: richTextStyle ??
                  TextStyle(
                    color: _getTextColor(),
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
