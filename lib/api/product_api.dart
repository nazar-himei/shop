import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductAPI {
  const ProductAPI(Dio dio) : _dio = dio;

  final Dio _dio;

  /// Fetch products from API[/products].
  Future<List<dynamic>>? fetchProducts({
    int offset = 0,
    int limit = 20,
  }) async {
    final response = await _dio.get<dynamic>(
      '/products?offset=$offset&limit=$limit',
    );

    return response.data as List<dynamic>;
  }
}
