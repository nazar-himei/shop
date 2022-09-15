import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:shop/api/product_api.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/repositories/product_repository/base_product_repository.dart';
import 'package:shop/utils/network/network_operation.dart';

/// [ProductRepositoryImpl] provide data products.
@Injectable(as: IProductRepository)
class ProductRepositoryImpl implements IProductRepository {
  const ProductRepositoryImpl(
    ProductAPI productAPI,
  ) : _productAPI = productAPI;

  final ProductAPI _productAPI;

  @override
  Future<Option<Either<Exception, List<ProductModel>>>> fetchProducts() =>
      networkOperation(
        () async {
          final data = await _productAPI.fetchProducts();

          return List.of(data ?? [])
              .cast<Map<String, dynamic>>()
              .map(ProductModel.fromMap)
              .toList();
        },
      );
}
