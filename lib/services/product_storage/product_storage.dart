import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:shop/models/product_model.dart';

/// [ProductStorage] Provide function for work with Hive(database).
@lazySingleton
class ProductStorage {
  static const _boxName = 'product';

  /// Open Product Box
  Future<Box<dynamic>> productBox() => Hive.openBox(_boxName);

  // Get products from storage
  Future<List<ProductModel>> getProducts() async {
    final box = await productBox();

    return List<ProductModel>.from(
      box.values.toList().first as List<dynamic>,
    );
  }

  // Add all your products to storage
  Future<void> addAllProducts(List<ProductModel> productModel) async {
    final box = await productBox();
    await box.add(productModel);
  }

  // Delete element from storage
  Future<void> deletFromBox(int index) async {
    final box = await productBox();
    await box.deleteAt(index);
  }

  // Delete all elements from storage
  Future<void> dropBox() async {
    final box = await productBox();
    await box.clear();
  }
}
