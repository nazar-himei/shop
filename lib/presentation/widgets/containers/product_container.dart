import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/presentation/widgets/loaders/loader.dart';

/// Container for show product.
/// Information [title],[description] about product.
/// Image internet url [imageUrl].
class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.title,
    required this.description,
    this.imageUrl,
  });

  /// Title of product
  final String title;

  /// Description of product
  final String description;

  /// Image url of product
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 95,
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? '',
            height: 75,
            width: 75,
            imageBuilder: (context, imageProvider) => DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            placeholder: (_, __) => const Loader(),
            errorWidget: (_, __, ___) => const Icon(Icons.error),
          ),
        ),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
