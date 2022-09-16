import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop/cubits/product/product_cubit.dart';
import 'package:shop/repositories/product_repository/mock/mock_product_repository.dart';
import 'package:shop/services/product_storage/mock/mock_product_storage.dart';
import 'package:shop/utils/network/network_exception.dart';

/// Unit tests for testing ShopCubit.
void main() {
  group(
    'Testing ShopCubit',
    () {
      late MockProductRepository mockProductRepository;
      late MockProductStorage mockProductStorage;
      late ShopCubit productCubit;

      setUp(() {
        mockProductRepository = MockProductRepository();
        mockProductStorage = MockProductStorage();
        productCubit = ShopCubit(mockProductRepository, mockProductStorage);
      });

      blocTest<ShopCubit, ShopState>(
        'emits [ProductState.loading, ProductState.success] states for '
        'successful product loads',
        build: () => productCubit,
        act: (cubit) {
          templateForFakeAnswer(
            mockProductRepository.fetchProducts,
            success,
          );
          fakeAnswerProductStorageAddProducts(mockProductStorage);
          cubit.fetchProducts();
        },
        expect: () => [
          const ShopState.loading(),
          ShopState.success(exampleProducts),
        ],
      );

      blocTest<ShopCubit, ShopState>(
        'emits [ProductState.loading, ProductState.failure] states for '
        'failure product loads',
        build: () => productCubit,
        act: (cubit) {
          templateForFakeAnswer(
            mockProductRepository.fetchProducts,
            failure,
          );
          fakeAnswerProductStorageGetProducts(mockProductStorage);
          cubit.fetchProducts();
        },
        expect: () => [
          const ShopState.loading(),
          const ShopState.failure(
            NetworkException(),
          ),
          ShopState.success(
            exampleProducts,
          ),
        ],
      );
    },
  );
}
