/// Model for Exception from Dio client
class NetworkException implements Exception {
  const NetworkException({
    this.statusCode,
    this.message,
  });

  final int? statusCode;
  final String? message;
}
