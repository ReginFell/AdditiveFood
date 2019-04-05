import 'package:additive_food/data/adittive/additive_repository.dart';
import 'package:additive_food/data/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'config.dart';

final Injection injection = Injection();

class Injection {
  GetIt get = new GetIt();

  createGraph() {
    get.registerSingleton(_createHttpClient());
    get.registerSingleton(_createApi(API_URL, LANGUAGE, get<http.Client>()));
    get.registerSingleton(_createAdditiveRepository(get<Api>()));

    get.registerSingleton(_createTheme());
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
