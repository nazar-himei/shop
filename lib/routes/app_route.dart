import 'package:auto_route/auto_route.dart';
import 'package:shop/presentation/screens/detail_product/detail_product.dart';
import 'package:shop/presentation/screens/home/home.dart';

/// MaterialPageRoute for navigation on the project
@MaterialAutoRouter(
  replaceInRouteName: 'Page Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: Home,
      initial: true,
    ),
    AutoRoute(
      page: DetailsProduct,
    ),
  ],
)
class $AppRouter {}
