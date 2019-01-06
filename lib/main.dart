import 'package:additive_food/app_state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main() {
  final store = new Store(null);

  runApp(AdditiveFoodApplication(store: store));
}

class AdditiveFoodApplication extends StatefulWidget {
  final Store store;

  AdditiveFoodApplication({Key key, this.store}) : super(key: key);

  @override
  AdditiveFoodAppState createState() => AdditiveFoodAppState();
}


