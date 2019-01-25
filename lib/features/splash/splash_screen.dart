import 'package:additive_food/app_state.dart';
import 'package:additive_food/features/splash/splash_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SplashScreen extends StatefulWidget {
  static final String route = '/';

  SplashScreen() : super(key: Key(route));

  @override
  SplashScreenState createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        onInit: (store) => store.dispatch(splashCountdownAction),
        converter: (store) => store.state,
        builder: (context, state) {
          return Image(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill,
          );
        });
  }
}
