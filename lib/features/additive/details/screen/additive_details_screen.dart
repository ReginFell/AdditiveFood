import 'package:additive_food/data/adittive/model/additive.dart';
import 'package:flutter/material.dart';

class AdditiveDetailsScreen extends StatefulWidget {
  static final String route = '/additive_details';

  final Additive additive;

  AdditiveDetailsScreen({Key key, @required this.additive}) : super(key: key);

  @override
  AdditiveDetailsWidgetState createState() {
    return new AdditiveDetailsWidgetState();
  }
}

class AdditiveDetailsWidgetState extends State<AdditiveDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Text("212");
  }
}
