import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/presentation/widgets/loaders/loader.dart';

/// ImageContainer widget for show Image from internet.
/// Path [imageUrl] for get image from internet.
/// Size of container [height],[width]
class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.imageUrl,
    this.height = 75,
    this.width = 75,
  });

  final String imageUrl;
  final double height;
  final double width;

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
            fit: BoxFit.contain,
          ),
        ),
      ),
      placeholder: (_, __) => const Loader(),
      errorWidget: (_, __, ___) => const Icon(Icons.error),
    );
  }
}
