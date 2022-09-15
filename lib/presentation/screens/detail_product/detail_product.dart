import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/widgets/containers/image_container.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ImageContainer(
              width: double.infinity,
              imageUrl: product.images?.first ?? '',
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: textStyles.headline6,
                  ),
                  Text(
                    product.description,
                    style: textStyles.subtitle1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
