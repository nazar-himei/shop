import 'package:flutter/material.dart';
import 'package:shop/injection/injection.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/widgets/containers/product_container.dart';
import 'package:shop/routes/app_route.gr.dart';

/// ProductListView listview products.
class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
    required this.products,
    this.onTap,
    this.onTapLoadData,
  });

  final List<ProductModel> products;
  final VoidCallback? onTap;
  final VoidCallback? onTapLoadData;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 15,
              ),
              child: Text('Products Empty'),
            ),
            OutlinedButton(
              onPressed: onTapLoadData,
              child: const Text('Try again'),
            )
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      itemBuilder: (_, i) {
        final product = products.elementAt(i);

        return GestureDetector(
          onTap: onTap ??
              () => getIt<AppRouter>().navigate(
                    DetailsProductRoute(
                      product: product,
                    ),
                  ),
          child: ProductContainer(
            title: product.title,
            description: product.description,
            imageUrl: product.images?.first,
          ),
        );
      },
    );
  }
}
