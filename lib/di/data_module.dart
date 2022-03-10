import 'package:get_it/get_it.dart';
import 'package:my_portfolio/data/local/local_data_source.dart';

///
Future<void> dataModule(GetIt getIt) async {
  ///
  getIt.registerLazySingleton(() => LocalDataSource());
}
