import 'dart:async';

import 'package:additive_food/features/app/app_state.dart';
import 'package:additive_food/features/home/home_screen.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

const int SPLASH_DURATION = 2;

ThunkAction<AppState> splashCountdownAction = (Store<AppState> store) async {
  Timer(Duration(seconds: SPLASH_DURATION),
      () => store.dispatch(NavigateToAction.replace(HomeScreen.route)));
};
