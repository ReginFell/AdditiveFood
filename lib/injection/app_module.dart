import 'package:additive_food/data/api.dart';
import 'package:additive_food/injection/getit_module.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AppModule implements GetItModule {
  final String apiUrl;
  final String language;

  AppModule(this.apiUrl, this.language);

  createGraph(GetIt injector) {
    injector.registerSingleton(_createHttpClient());
    injector.registerSingleton(
        _createApi(apiUrl, language, injector<http.Client>()));

    injector.registerSingleton(_createTheme());
  }

  http.Client _createHttpClient() {
    return http.Client();
  }

  Api _createApi(String baseUrl, String language, http.Client client) {
    return Api(baseUrl, language, client);
  }

  ThemeData _createTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      accentColor: Colors.cyan[600],
      textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    );
  }
}
