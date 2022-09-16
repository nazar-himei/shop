import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/repositories/product_repository/base_product_repository.dart';
import 'package:shop/services/product_storage/base_product_storage.dart';
import 'package:shop/services/product_storage/product_storage_impl.dart';
import 'package:shop/utils/network/network_exception.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

@injectable
class ShopCubit extends Cubit<ShopState> {
  ShopCubit(
    IProductRepository productRepository,
    ProductStorageImpl productStorage,
  )   : _productRepository = productRepository,
        _productStorage = productStorage,
        super(const ShopState.initial());

  late final IProductRepository _productRepository;
  late final IProductStorage _productStorage;

  /// Fetch products from repository.
  /// If a user has a bad request data will be loading from the database.
  Future<void> fetchProducts() async {
    emit(const ShopState.loading());

    final products = await _productRepository.fetchProducts();

    products.map(
      (productsData) => productsData.fold(
        (exception) async {
          final networkexception = exception as NetworkException;
          final storageProducts = await _productStorage.getProducts();

          emit(ShopState.failure(networkexception, storageProducts));
        },
        (products) {
          _addProductsToBox(products, forceAddProducts: true);
          emit(ShopState.success(products));
        },
      ),
    );
  }

  /// Add products to database.
  /// Data [products] to be added to database.
  /// [forceAddProducts] Сlean up database before save data [products].
  Future<void> _addProductsToBox(
    List<ProductModel> products, {
    bool forceAddProducts = false,
  }) async {
    if (forceAddProducts) {
      await _productStorage.deleteAllProducts();
    }

    await _productStorage.addAllProducts(products);
  }
}
