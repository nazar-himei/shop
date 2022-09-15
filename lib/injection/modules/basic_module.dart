import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shop/routes/app_route.gr.dart';
import 'package:shop/utils/static/urls.dart';

/// Module for generate injection
@module
abstract class BasicModule {
  @lazySingleton
  AppRouter get appRouter => AppRouter();

  @singleton
  @preResolve
  Future<Dio> dio() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: Urls.home,
        connectTimeout: 40000,
        receiveTimeout: 20000,
      ),
    );

    dio.interceptors.addAll([
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    ]);

    return dio;
  }
}
