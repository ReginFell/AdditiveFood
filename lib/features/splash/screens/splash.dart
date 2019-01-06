import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static final String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
    );
  }
}
