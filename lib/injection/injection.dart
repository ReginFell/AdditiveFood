import 'package:additive_food/injection/getit_module.dart';
import 'package:get_it/get_it.dart';

class Injection {
  GetIt _getIt = new GetIt();

  Injection(List<GetItModule> modules) {
    modules.forEach((module) {
      module.createGraph(_getIt);
    });
  }

  T get<T>() {
    return _getIt.get<T>();
  }
}
