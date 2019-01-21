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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/images/background.png"),
      fit: BoxFit.fitWidth,
    );
  }
}
