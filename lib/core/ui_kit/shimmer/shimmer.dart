import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerX extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const ShimmerX({
    this.borderRadius = 6,
    this.width = 25,
    this.height = 25,
    this.margin,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Shimmer.fromColors(
        baseColor: const Color(0XFFE1E1E1),
        highlightColor: Colors.grey.withOpacity(0.5),
        child: Container(
          padding: padding,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
