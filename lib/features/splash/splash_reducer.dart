import 'package:additive_food/app_state.dart';
import 'package:additive_food/features/splash/splash_actions.dart';

AppState splashReducer(AppState prev, action) {
  if (action == splashCountdownAction) {
    AppState newAppState = new AppState();

    return newAppState;
  } else {
    return prev;
  }
}
