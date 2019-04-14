import 'package:additive_food/data/api.dart';
import 'package:additive_food/injection/getit_module.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

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
    final colorAccent = Color(0xFF6E0091);

    return ThemeData(
      dividerColor: Color(0xFF56FFAB),
      brightness: Brightness.light,
      primaryColor: Colors.white,
      highlightColor: Color(0xFF56FFAB),
      accentColor: colorAccent,
      textTheme: TextTheme(
        headline: TextStyle(
            fontSize: 72.0, fontWeight: FontWeight.bold, color: colorAccent),
        title: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.bold, color: colorAccent),
        subtitle: TextStyle(fontSize: 14.0, color: colorAccent),
        body1: TextStyle(fontSize: 14.0, color: colorAccent),
      ),
    );
  }
}
