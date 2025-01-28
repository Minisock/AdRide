import 'package:app/shared/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomText({
    required this.text,
    this.style,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.color,
    this.fontSize,
    this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle effectiveStyle =
        (style ?? AppTextStyles.bodyText1).copyWith(
      color: color ?? style?.color,
      fontSize: fontSize ?? style?.fontSize,
      fontWeight: fontWeight ?? style?.fontWeight,
    );

    return Text(
      text,
      style: effectiveStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
