import 'package:flutter/material.dart';

class Page {
  final int index;
  final String route;
  final GlobalKey<NavigatorState> navigator;
  final WidgetBuilder builder;

  Page(this.index, this.route, this.navigator, this.builder);
}

class HomeNavigator extends StatelessWidget {
  final Page page;

  HomeNavigator({this.page});

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: page.navigator,
        initialRoute: page.route,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(builder: (context) => page.builder(context));
        });
  }
}
