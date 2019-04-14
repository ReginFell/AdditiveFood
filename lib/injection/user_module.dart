import 'package:additive_food/data/api.dart';
import 'package:additive_food/data/user/user_repository.dart';
import 'package:additive_food/injection/getit_module.dart';
import 'package:get_it/get_it.dart';

class UserModule implements GetItModule {
  @override
  void createGraph(GetIt injector) {
    injector.registerSingleton(_createUserRepository(injector.get()));
  }

  UserRepository _createUserRepository(Api api) {
    return UserRepository(api);
  }
}
