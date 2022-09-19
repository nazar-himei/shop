import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/presentation/widgets/loaders/loader.dart';

/// ImageContainer widget for show Image from internet.
/// Path [imageUrl] for get image from internet.
/// Size of container [height],[width]
/// The default is [BoxFit.scaleDown] if [centerSlice] is null, and
/// [BoxFit.fill] if [centerSlice] is not null.
///
/// See the discussion at [paintImage] for more details.
class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.imageUrl,
    this.height = 75,
    this.width = 75,
    this.boxFit = BoxFit.contain,
  });

  /// [imageUrl] For load image from internet
  final String imageUrl;

  /// Height of container image
  final double height;

  /// Width of container image
  final double width;

  /// Box fit of container image
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) => DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit,
          ),
        ),
      ),
      placeholder: (_, __) => const Loader(),
      errorWidget: (_, __, ___) => const Icon(Icons.error),
    );
  }
}
