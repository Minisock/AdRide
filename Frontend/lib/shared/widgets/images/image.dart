import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final bool isNetworkImage;
  final Widget? placeholder;

  const CustomImage({
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0.0,
    this.isNetworkImage = false,
    this.placeholder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: isNetworkImage
          ? _buildNetworkImage()
          : Image.asset(
              imagePath,
              width: width,
              height: height,
              fit: fit,
            ),
    );
  }

  Widget _buildNetworkImage() {
    return Image.network(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder ??
            Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
      },
      errorBuilder: (context, error, stackTrace) {
        return placeholder ??
            Center(
              child: Icon(Icons.error, size: width ?? 50, color: Colors.red),
            );
      },
    );
  }
}
