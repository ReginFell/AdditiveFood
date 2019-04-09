import 'package:additive_food/data/adittive/model/additive.dart';
import 'package:flutter/material.dart';

class AdditiveDetailsScreen extends StatefulWidget {
  static final String route = '/additive_details';

  final Additive additive;

  AdditiveDetailsScreen({Key key, @required this.additive}) : super(key: key);

  @override
  _AdditiveDetailsState createState() {
    return new _AdditiveDetailsState(additive);
  }
}

class _AdditiveDetailsState extends State<AdditiveDetailsScreen> {
  final Additive additive;

  _AdditiveDetailsState(this.additive);

  @override
  Widget build(BuildContext context) {
    return Text(additive.name);
  }
}
