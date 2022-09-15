import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop/cubits/product/product_cubit.dart';
import 'package:shop/injection/injection.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/routes/app_route.gr.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Set injection getIt
  await configureInjection();

  /// Init database Have
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return BlocProvider(
      create: (context) => getIt<ShopCubit>()..fetchProducts(),
      child: MaterialApp.router(
        title: 'Shop',
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
