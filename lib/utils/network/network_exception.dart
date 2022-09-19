/// Model for Exception from Dio client
class NetworkException implements Exception {
  const NetworkException({
    this.statusCode,
    this.message,
  });

  /// Network status code
  final int? statusCode;

  /// Network messages exception
  final String? message;
}
