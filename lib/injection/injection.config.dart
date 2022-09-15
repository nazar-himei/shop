// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/product_api.dart' as _i5;
import '../cubits/product/product_cubit.dart' as _i9;
import '../repositories/product_repository/base_product_repository.dart' as _i7;
import '../repositories/product_repository/product_repository_impl.dart' as _i8;
import '../routes/app_route.gr.dart' as _i3;
import '../services/product_storage/product_storage.dart' as _i6;
import 'modules/basic_module.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final basicModule = _$BasicModule();
  gh.lazySingleton<_i3.AppRouter>(() => basicModule.appRouter);
  await gh.singletonAsync<_i4.Dio>(
    () => basicModule.dio(),
    preResolve: true,
  );
  gh.factory<_i5.ProductAPI>(() => _i5.ProductAPI(get<_i4.Dio>()));
  gh.lazySingleton<_i6.ProductStorage>(() => _i6.ProductStorage());
  gh.factory<_i7.IProductRepository>(
      () => _i8.ProductRepositoryImpl(get<_i5.ProductAPI>()));
  gh.factory<_i9.ShopCubit>(() => _i9.ShopCubit(
        get<_i7.IProductRepository>(),
        get<_i6.ProductStorage>(),
      ));
  return get;
}

class _$BasicModule extends _i10.BasicModule {}
