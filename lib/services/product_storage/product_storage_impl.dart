import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/services/product_storage/base_product_storage.dart';

/// [ProductStorageImpl] Provide functions for work with Hive(database).
@lazySingleton
@Injectable(as: IProductStorage)
class ProductStorageImpl implements IProductStorage {
  static const _boxName = 'product';

  /// Open Box Product
  Future<Box<dynamic>> productBox() => Hive.openBox(_boxName);

  /// Get products from storage
  @override
  Future<List<ProductModel>> getProducts() async {
    final box = await productBox();

    return List<ProductModel>.from(
      box.values.toList().first as List<dynamic>,
    );
  }

  /// Add all your products to storage
  @override
  Future<void> addAllProducts(List<ProductModel> productModel) async {
    final box = await productBox();
    await box.add(productModel);
  }

  /// Delete element from storage
  @override
  Future<void> deleteProduct(int index) async {
    final box = await productBox();
    await box.deleteAt(index);
  }

  /// Delete all elements from storage
  @override
  Future<void> deleteAllProducts() async {
    final box = await productBox();
    await box.clear();
  }

  /// Get detail product from storage.
  @override
  Future<ProductModel> getProduct(int index) async {
    final product = await productBox();
    return product.getAt(index);
  }
}
