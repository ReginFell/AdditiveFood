import 'package:additive_food/data/user/model/user.dart';
import 'package:additive_food/data/user/user_repository.dart';
import 'package:additive_food/features/app/app_state.dart';
import 'package:additive_food/main.dart';
import 'package:redux/redux.dart';

class StartLoadingAction {}

class ProfileLoadedAction {
  final User user;

  ProfileLoadedAction(this.user);
}

class LoadProfileAction {
  LoadProfileAction(Store<AppState> store) {
    store.dispatch(StartLoadingAction());
    UserRepository repository = injection.get<UserRepository>();

    repository.me().then((user) => store.dispatch(ProfileLoadedAction(user)));
  }
}
