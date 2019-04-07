import 'dart:async';

import 'package:additive_food/features/app/app_state.dart';
import 'package:additive_food/features/home/home_screen.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';

class SplashCountdownAction {
  static final int splashDuration = 2;

  SplashCountdownAction(Store<AppState> store) {
    Timer(Duration(seconds: splashDuration),
        () => store.dispatch(NavigateToAction.replace(HomeScreen.route)));
  }
}
