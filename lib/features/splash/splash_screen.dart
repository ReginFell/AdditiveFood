import 'package:additive_food/app_state.dart';
import 'package:additive_food/features/home/screens/home.dart';
import 'package:additive_food/features/splash/splash_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';

class SplashScreen extends StatefulWidget {
  static final String route = '/';

  SplashScreen() : super(key: Key(route));

  @override
  SplashScreenState createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  static const int SPLASH_DURATION = 2;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(converter: (store) {
      return () => store.dispatch(startSplashCountdown);
    }, builder: (context, callback) {
      return Image(
        image: AssetImage("assets/images/background.png"),
        fit: BoxFit.fitWidth,
      );
    });
  }
}
