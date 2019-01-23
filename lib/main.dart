import 'package:additive_food/features/home/screens/home.dart';
import 'package:additive_food/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = new Store(null);

  runApp(AdditiveFoodApplication(store: store));
}

class AdditiveFoodApplication extends StatefulWidget {
  final Store store;

  AdditiveFoodApplication({Key key, this.store}) : super(key: key);

  @override
  AdditiveFoodAppState createState() => AdditiveFoodAppState();
}

class AdditiveFoodAppState extends State<AdditiveFoodApplication> {
  
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: widget.store,
      child: MaterialApp(
        title: 'Additive Food',
        theme: createTheme(),
        routes: createRoutes(),
      ),
    );
  }
}

ThemeData createTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green[800],
    accentColor: Colors.cyan[600],
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}

Map<String, WidgetBuilder> createRoutes() {
  return {
    SplashScreen.route: (context) => SplashScreen(),
    HomeScreen.route: (context) => HomeScreen(),
  };
}

