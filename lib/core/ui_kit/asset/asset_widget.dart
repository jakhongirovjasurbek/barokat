library asset_x;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

part 'asset.dart';

/// A widget that renders different types of assets based on the provided [AssetX] type.
///
/// The [AssetXWidget] can display SVGs, images, or icons depending on the specific
/// type of asset passed to it. It also supports setting custom [color], [height],
/// [width], and [boxFit] properties for greater flexibility.
class AssetXWidget extends StatelessWidget {
  /// The [AssetX] object that determines what asset type will be rendered.
  final AssetX asset;

  /// The color to be applied to the asset, if applicable.
  final Color? color;

  /// The width of the asset widget.
  final double? width;

  /// The height of the asset widget.
  final double? height;

  /// The box fit for scaling the asset, if applicable.
  final BoxFit? boxFit;

  final EdgeInsetsGeometry? padding;

  /// Constructs an [AssetXWidget] with a required [asset] parameter and optional
  /// [color], [width], [height], and [boxFit] parameters.
  const AssetXWidget({
    required this.asset,
    this.color,
    this.width,
    this.height,
    this.boxFit,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero, // Adjust the value as needed
      child: switch (asset) {
        final SvgAssetX svg => SvgPicture(
          svg.loader,
          width: width,
          height: height,
          fit: boxFit ?? BoxFit.contain,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
        ),
        final ImageAssetX image => Image(
          image: image.provider,
          width: width,
          height: height,
          color: color,
          fit: boxFit ?? BoxFit.contain,
        ),
        final IconX icon => Icon(
          icon.data,
          color: color,
          size: width, // Typically, width is treated as size for icons
        ),
        _ => throw UnimplementedError(),
      },
    );
  }
}
