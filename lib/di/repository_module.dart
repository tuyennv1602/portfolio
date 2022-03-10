import 'package:get_it/get_it.dart';
import 'package:my_portfolio/data/repositories/local_repository.dart';

///
Future<void> repositoryModule(GetIt getIt) async {
  ///
  getIt.registerLazySingleton<LocalRepository>(() => LocalRepositoryImpl(getIt()));
}
