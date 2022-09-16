import 'package:shop/models/product_model.dart';

/// Interface for product storage.
abstract class IProductStorage {
  /// Get all products from database.
  Future<List<ProductModel>> getProducts();

  /// Get detail product from database.
  Future<ProductModel> getProdcut(int index);

  /// Add new products to database.
  Future<void> addAllProducts(List<ProductModel> products);

  /// Delete product from database.
  Future<void> deleteProduct(int index);

  /// Delete all products from database.
  Future<void> deleteAllProducts();
}
