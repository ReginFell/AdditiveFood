import 'dart:async';

import 'package:additive_food/data/adittive/model/additive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  final String _baseUrl;
  final String _language;
  final http.Client _client;

  Api(this._baseUrl, this._language, this._client);

  Future<List<Additive>> loadAdditives() async {
    http.Response response = await _client.get("$_baseUrl/additive/$_language/.json");

    Map data = json.decode(response.body);

    return data.values.map((model) => Additive.fromJson(model)).toList();
  }
}
