import 'dart:async';

import 'package:additive_food/data/adittive/model/additive.dart';
import 'package:additive_food/data/api.dart';

class AdditiveRepository {
  final Api api;

  AdditiveRepository(this.api);

  Future<List<Additive>> fetchAdditives() {
    return api.loadAdditives();
  }
}
