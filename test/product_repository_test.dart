import 'package:flutter_test/flutter_test.dart';
import 'package:shop/repositories/product_repository/mock/mock_product_repository.dart';

/// Unit tests for testing Product Repository.
void main() {
  group('Testing Product Repository', () {
    late MockProductRepository mockProductRepository;

    setUp(() {
      mockProductRepository = MockProductRepository();
    });

    test('Test method fetchProducts, status: successful', () {
      templateForFakeAnswer(mockProductRepository.fetchProducts, success);

      mockProductRepository.fetchProducts();

      expect(mockProductRepository.fetchProducts(), success);
    });

    test('Test method fetchProducts status: failure', () {
      templateForFakeAnswer(mockProductRepository.fetchProducts, failure);

      mockProductRepository.fetchProducts();

      expect(mockProductRepository.fetchProducts(), failure);
    });
  });
}
