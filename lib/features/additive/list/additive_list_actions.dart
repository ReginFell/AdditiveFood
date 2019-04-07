import 'package:additive_food/data/adittive/additive_repository.dart';
import 'package:additive_food/data/adittive/model/additive.dart';
import 'package:additive_food/features/app/app_state.dart';
import 'package:additive_food/main.dart';
import 'package:redux/redux.dart';

class LoadingAction {}

class AdditivesLoadedAction {
  final List<Additive> additives;

  AdditivesLoadedAction(this.additives);
}

class AdditiveLoadingError {
  final Exception error;

  AdditiveLoadingError(this.error);
}

class LoadAdditivesAction {
  LoadAdditivesAction(Store<AppState> store) {
    store.dispatch(LoadingAction());
    AdditiveRepository repository = injection.get<AdditiveRepository>();

    repository
        .fetchAdditives()
        .then((value) => store.dispatch(AdditivesLoadedAction(value)))
        .catchError((error) => store.dispatch(AdditiveLoadingError(error)));
  }
}
