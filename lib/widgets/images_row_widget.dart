import 'package:flutter/material.dart';

/// Widget to display two images in a row (local asset and network image)
class ImagesRowWidget extends StatelessWidget {
  final String assetImagePath;
  final String networkImageUrl;
  final double imageWidth;
  final double imageHeight;
  final double gap;

  const ImagesRowWidget({
    super.key,
    required this.assetImagePath,
    required this.networkImageUrl,
    this.imageWidth = 100,
    this.imageHeight = 100,
    this.gap = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Local asset image
        Image.asset(
          assetImagePath,
          width: imageWidth,
          height: imageHeight,
          fit: BoxFit.cover,
        ),
        SizedBox(width: gap),
        // Network image
        Image.network(
          networkImageUrl,
          width: imageWidth,
          height: imageHeight,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
