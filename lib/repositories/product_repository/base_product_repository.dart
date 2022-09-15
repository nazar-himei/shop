import 'package:fpdart/fpdart.dart';
import 'package:shop/models/product_model.dart';

/// Interface for product repository.
abstract class IProductRepository {
  const IProductRepository._();

  Future<Option<Either<Exception, List<ProductModel>>>> fetchProducts();
}
