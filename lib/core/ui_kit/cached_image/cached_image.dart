import 'package:barokat/core/ui_kit/shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit? fit;

  const CachedImage({
    required this.imageUrl,
    this.borderRadius = 0,
    this.width,
    this.height,
    this.fit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) => ShimmerX(
          width: width ?? 25,
          height: height ?? 25,
          borderRadius: borderRadius,
        ),
        errorWidget: (context, url, error) => ShimmerX(
          width: width ?? 25,
          height: height ?? 25,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
