import 'package:additive_food/data/adittive/additive_repository.dart';
import 'package:additive_food/data/api.dart';
import 'package:additive_food/injection/getit_module.dart';
import 'package:get_it/get_it.dart';

class AdditiveModule implements GetItModule {
  @override
  void createGraph(GetIt injector) {
    injector.registerSingleton(_createAdditiveRepository(injector.get()));
  }

  AdditiveRepository _createAdditiveRepository(Api api) {
    return AdditiveRepository(api);
  }
}
