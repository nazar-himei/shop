import 'package:mocktail/mocktail.dart';
import 'package:shop/repositories/product_repository/mock/mock_product_repository.dart';
import 'package:shop/services/product_storage/product_storage_impl.dart';

class MockProductStorage extends Mock implements ProductStorageImpl {}

/// Fake answer for method [mockProductStorage.getProducts()]
void fakeAnswerProductStorageGetProducts(
  MockProductStorage mockProductStorage,
) {
  when(() => mockProductStorage.getProducts()).thenAnswer(
    (_) => Future.value(
      exampleProducts,
    ),
  );
}

/// Fake answer for methods [addAllProducts(),dropBox()]
void fakeAnswerProductStorageAddProducts(
  MockProductStorage mockProductStorage,
) {
  when(() => mockProductStorage.addAllProducts(exampleProducts)).thenAnswer(
    (_) => Future<void>.value(),
  );

  when(() => mockProductStorage.deleteAllProducts()).thenAnswer(
    (_) => Future<void>.value(),
  );
}
