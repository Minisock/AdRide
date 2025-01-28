import 'package:app/shared/styles/app_text_styles.dart';
import 'package:app/shared/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextDivider extends StatelessWidget {
  final String text;
  final double lineWidth;
  final double padding;
  final TextStyle? textStyle;

  const CustomTextDivider({
    Key? key,
    required this.text,
    this.lineWidth = 10.0, // Default shorter line
    this.padding = 8.0, // Padding between text and lines
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Left Divider Line
        Container(
          height: 1.0,
          width: lineWidth,
          color: Colors.grey,
        ),
        // Text
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: CustomText(text: text, style: AppTextStyles.h5),
        ),
        // Right Divider Line
        Container(
          height: 1.0,
          width: lineWidth,
          color: Colors.grey,
        ),
      ],
    );
  }
}
