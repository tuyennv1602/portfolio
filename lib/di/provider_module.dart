import 'package:get_it/get_it.dart';
import 'package:my_portfolio/shared/models/app_model.dart';
import 'package:my_portfolio/views/portfolio/model/portfolio_model.dart';

///
Future<void> providerModule(GetIt getIt) async {
  getIt
    ..registerLazySingleton<AppModel>(() => AppModel())
    ..registerLazySingleton<PortfolioModel>(() => PortfolioModel(getIt()));
}
