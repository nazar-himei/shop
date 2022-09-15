// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../models/product_model.dart' as _i5;
import '../presentation/screens/detail_product/detail_product.dart' as _i2;
import '../presentation/screens/home/home.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Home(),
      );
    },
    DetailsProductRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsProductRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.DetailsProduct(
          key: args.key,
          product: args.product,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          DetailsProductRoute.name,
          path: '/details-product',
        ),
      ];
}

/// generated route for
/// [_i1.Home]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.DetailsProduct]
class DetailsProductRoute extends _i3.PageRouteInfo<DetailsProductRouteArgs> {
  DetailsProductRoute({
    _i4.Key? key,
    required _i5.ProductModel product,
  }) : super(
          DetailsProductRoute.name,
          path: '/details-product',
          args: DetailsProductRouteArgs(
            key: key,
            product: product,
          ),
        );

  static const String name = 'DetailsProductRoute';
}

class DetailsProductRouteArgs {
  const DetailsProductRouteArgs({
    this.key,
    required this.product,
  });

  final _i4.Key? key;

  final _i5.ProductModel product;

  @override
  String toString() {
    return 'DetailsProductRouteArgs{key: $key, product: $product}';
  }
}
