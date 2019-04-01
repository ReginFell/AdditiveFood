import 'package:additive_food/data/adittive/additive_repository.dart';
import 'package:additive_food/data/adittive/model/additive.dart';
import 'package:additive_food/features/app/app_state.dart';
import 'package:additive_food/main.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class LoadingAction {}

class AdditivesLoadedAction {
  List<Additive> additives;

  AdditivesLoadedAction(this.additives);
}

ThunkAction<AppState> loadPosts = (Store<AppState> store) async {
  store.dispatch(LoadingAction());
  AdditiveRepository repository = getIt<AdditiveRepository>();

  store.dispatch(AdditivesLoadedAction(await repository.fetchAdditives()));
};
