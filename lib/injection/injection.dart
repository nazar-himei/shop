import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shop/injection/injection.config.dart';

final getIt = GetIt.instance;

/// Init injections for [getIt]
@injectableInit
Future<void> configureInjection({String? environment}) async {
  await $initGetIt(getIt, environment: environment);
}
