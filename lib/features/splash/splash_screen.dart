import 'dart:async';

import 'package:additive_food/features/home/screens/home.dart';
import 'package:flutter/material.dart';

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

  SplashScreenState() : super();

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: SPLASH_DURATION);
    return new Timer(duration, navigationPage);
  }

  void navigationPage() {
      Navigator.of(context).pushReplacementNamed(HomeScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/images/background.png"),
      fit: BoxFit.fitWidth,
    );
  }
}
