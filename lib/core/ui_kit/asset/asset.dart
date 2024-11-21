part of 'asset_widget.dart';

/// Base class for handling different types of assets (e.g., SVGs, images, icons).
///
/// The [AssetX] class is an abstract class that holds the source of an asset.
/// It can be extended by specific asset types like [SvgAssetX], [ImageAssetX],
/// or [IconX] for handling different formats.
abstract interface class AssetX {
  /// The source of the asset, which can be a file path or a network URL.
  const AssetX([this.src]);

  /// The source of the asset, which may be null if the asset has no specific path.
  final String? src;
}

/// A class for handling SVG assets.
///
/// This class handles loading SVG assets from different sources, such as
/// the network or the local asset bundle.
final class SvgAssetX extends AssetX {
  /// Constructs an [SvgAssetX] with a custom [BytesLoader].
  ///
  /// - [loader] is used to load the SVG data, which can be from a network or assets.
  /// - [src] is the source of the SVG asset.
  const SvgAssetX(
      this.loader,
      super.src,
      );

  /// Constructs an [SvgAssetX] for loading SVGs from a network URL.
  SvgAssetX.network(super.src) : loader = SvgNetworkLoader(src!);

  /// Constructs an [SvgAssetX] for loading SVGs from local assets.
  SvgAssetX.asset(super.src) : loader = SvgAssetLoader(src!);

  /// The loader responsible for fetching the SVG data.
  final BytesLoader loader;
}

/// A class for handling icon assets.
///
/// This class represents an icon asset using Flutter's [IconData].
final class IconX extends AssetX {
  /// Constructs an [IconX] with the given [IconData].
  IconX(this.data);

  /// The data used to represent the icon.
  final IconData data;
}

/// A class for handling image assets.
///
/// This class supports loading images from assets or network URLs.
final class ImageAssetX extends AssetX {
  /// Constructs an [ImageAssetX] with an [ImageProvider].
  ///
  /// - [provider] is the image provider used to load the image data.
  const ImageAssetX(this.provider, super.src);

  /// Constructs an [ImageAssetX] for loading images from the asset bundle.
  ImageAssetX.asset(super.src) : provider = AssetImage(src!);

  /// Constructs an [ImageAssetX] for loading images from a network URL.
  ImageAssetX.network(super.src)
      : provider = ResizeImage.resizeIfNeeded(null, null, NetworkImage(src!));

  /// The provider used to fetch the image data.
  final ImageProvider<Object> provider;
}
