import 'package:additive_food/features/splash/screens/splash.dart';

import 'package:additive_food/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AdditiveFoodAppState extends State<AdditiveFoodApplication> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: widget.store,
      child: MaterialApp(
        title: 'Sample App',
        routes: {
          SplashScreen.route: (context) => SplashScreen(),
          // STARTER: routes - do not remove comment
        },
      ),
    );
  }
}