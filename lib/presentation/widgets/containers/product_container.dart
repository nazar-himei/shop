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

  final String title;
  final String description;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
        visualDensity: const VisualDensity(
          horizontal: -2,
          vertical: 4,
        ),
        leading: CachedNetworkImage(
          imageUrl: imageUrl ?? '',
          height: 75,
          width: 75,
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
        ),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
