import 'package:additive_food/config.dart';
import 'package:additive_food/features/app/app_state.dart';
import 'package:additive_food/features/home/home_screen.dart';
import 'package:additive_food/features/splash/splash_screen.dart';
import 'package:additive_food/injection/additive_module.dart';
import 'package:additive_food/injection/app_module.dart';
import 'package:additive_food/injection/getit_module.dart';
import 'package:additive_food/injection/injection.dart';
import 'package:additive_food/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'features/app/app_reducer.dart';
import 'injection/user_module.dart';

Injection injection;

void main() {
  final appModule = AppModule(apiUrl, language);
  final additiveModule = AdditiveModule();
  final userModule = UserModule();

  final List<GetItModule> modules = [appModule, additiveModule, userModule];

  injection = Injection(modules);

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
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context).title,
        supportedLocales: [
          const Locale("en"),
        ],
        initialRoute: SplashScreen.route,
        theme: injection.get(),
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
  Store<AppState> store =
      Store(appReducer, initialState: AppState(), middleware: [
    thunkMiddleware,
    NavigationMiddleware<AppState>(),
    //LoggingMiddleware.printer()
  ]);
  return store;
}
