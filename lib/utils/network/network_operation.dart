import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shop/utils/network/network_exception.dart';

/// Template method for request safety network to API
typedef NetworkOperation<T> = Future<T> Function();

/// Template for a safe request to API.
/// Option [right]return the  successful request to API.
/// Option [left] return the failure request to API.
Future<Option<Either<Exception, T>>> networkOperation<T>(
  NetworkOperation<T> operation,
) async {
  try {
    return optionOf(right(await operation()));
  } on DioError catch (error) {
    final response = error.response;

    return some(
      left(
        NetworkException(
          statusCode: response?.statusCode,
          message: response?.statusMessage,
        ),
      ),
    );
  } catch (error) {
    return some(
      left(
        error is Exception ? error : Exception(error),
      ),
    );
  }
}
