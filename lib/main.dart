import 'package:additive_food/config.dart';
import 'package:additive_food/features/app/app_state.dart';
import 'package:additive_food/features/home/home_screen.dart';
import 'package:additive_food/features/splash/splash_screen.dart';
import 'package:additive_food/injection.dart';
import 'package:additive_food/injection/additive_module.dart';
import 'package:additive_food/injection/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'features/app/app_reducer.dart';

Injection injection;

void main() {
  final appModule = AppModule(API_URL, LANGUAGE);
  final additiveModule = AdditiveModule();

  final modules = List();
  modules.add(appModule);
  modules.add(additiveModule);

  injection = Injection(List.unmodifiable(modules));

  final store = createStore();

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
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'Additive Food',
        theme: injection.get<ThemeData>(),
        navigatorKey: NavigatorHolder.navigatorKey,
        routes: createRoutes(),
      ),
    );
  }
}

Map<String, WidgetBuilder> createRoutes() {
  return {
    SplashScreen.route: (context) => SplashScreen(),
    HomeScreen.route: (context) => HomeScreen(),
  };
}

Store<AppState> createStore() {
  Store<AppState> store = Store(appReducer,
      initialState: AppState(),
      middleware: [
        thunkMiddleware,
        NavigationMiddleware<AppState>(),
        LoggingMiddleware.printer()
      ]);
  return store;
}
