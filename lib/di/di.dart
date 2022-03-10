import 'package:get_it/get_it.dart';
import 'package:my_portfolio/di/data_module.dart';

import 'provider_module.dart';
import 'repository_module.dart';

///
/// Setup Di
///
Future<void> setupDi() async {
  final getIt = GetIt.I;
  await dataModule(getIt);
  await repositoryModule(getIt);
  await providerModule(getIt);
}
