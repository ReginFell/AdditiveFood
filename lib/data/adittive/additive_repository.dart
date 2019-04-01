import 'dart:async';
import 'dart:convert';
import 'package:additive_food/data/adittive/model/additive.dart';
import 'package:http/http.dart' as http;

class AdditiveRepository {
  static final String URL =
      "https://additive-food-bef05.firebaseio.com/additive/ru/.json";

  Future<List<Additive>> getPost() async {
    final response = await http.get(URL);

    Map data = json.decode(response.body);

    return data.values.map((model) => Additive.fromJson(model)).toList();
  }
}
