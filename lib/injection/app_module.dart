import 'package:additive_food/data/api.dart';
import 'package:additive_food/injection/getit_module.dart';
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
  }

  http.Client _createHttpClient() {
    return http.Client();
  }

  Api _createApi(String baseUrl, String language, http.Client client) {
    return Api(baseUrl, language, client);
  }
}
