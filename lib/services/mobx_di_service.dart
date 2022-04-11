import 'package:get_it/get_it.dart';
import 'package:pattern_mobx/stores/create_store.dart';
import 'package:pattern_mobx/stores/edit_store.dart';
import 'package:pattern_mobx/stores/home_store.dart';

class DIService {
  GetIt getIt = GetIt.instance;

  Future<void> getService() async {
    getIt.registerLazySingleton(() => HomeStore());
    getIt.registerLazySingleton(() => CreateStore());
    getIt.registerLazySingleton(() => EditStore());
  }
}