import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/repositories/product_repository/product_repository_impl.dart';
import 'package:shop/utils/network/network_exception.dart';
import 'package:shop/utils/network/network_operation.dart';

class MockProductRepository extends Mock implements ProductRepositoryImpl {}

final exampleProducts = [
  ProductModel(
    id: 1,
    title: 'Product',
    description: 'descriptiom',
    images: [],
  )
];

final failure = Future<Option<Either<Exception, List<ProductModel>>>>.value(
  some(
    left(const NetworkException()),
  ),
);

final success = networkOperation(
  () => Future<List<ProductModel>>.value(
    exampleProducts,
  ),
);

void templateForFakeAnswer(
  Function() fakeCallMethod,
  dynamic fakeAnswer,
) =>
    when(fakeCallMethod).thenAnswer(
      (_) => fakeAnswer,
    );
