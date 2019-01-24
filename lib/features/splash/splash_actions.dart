import 'dart:async';

import 'package:additive_food/app_state.dart';
import 'package:additive_food/features/home/screens/home.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

const int SPLASH_DURATION = 2;

ThunkAction<AppState> startSplashCountdown = (Store<AppState> store) async {
  var duration = Duration(seconds: SPLASH_DURATION);
  return Timer(duration, openHome);
};

void openHome() {
  NavigateToAction.replace(HomeScreen.route);
}
