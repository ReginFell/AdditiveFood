import 'package:additive_food/data/adittive/additive_repository.dart';
import 'package:additive_food/data/api.dart';
import 'package:additive_food/features/home/home_screen.dart';
import 'package:additive_food/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'features/app/app_reducer.dart';
import 'package:additive_food/features/app/app_state.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'config.dart';

GetIt getIt = new GetIt();

void main() {
  getIt.registerSingleton(_createHttpClient());
  getIt.registerSingleton(_createApi(API_URL, LANGUAGE, getIt<http.Client>()));
  getIt.registerSingleton(_createAdditiveRepository(getIt<Api>()));

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
        theme: createTheme(),
        navigatorKey: NavigatorHolder.navigatorKey,
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

http.Client _createHttpClient() {
  return http.Client();
}

Api _createApi(String baseUrl, String language, http.Client client) {
  return Api(baseUrl, language, client);
}

AdditiveRepository _createAdditiveRepository(Api api) {
  return AdditiveRepository(api);
}
