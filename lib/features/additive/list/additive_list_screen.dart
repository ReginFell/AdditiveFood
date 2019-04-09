import 'package:additive_food/data/adittive/model/additive.dart';
import 'package:additive_food/features/additive/details/additive_details_screen.dart';
import 'package:additive_food/features/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'additive_list_actions.dart';
import 'additive_list_state.dart';

class AdditiveListScreen extends StatefulWidget {
  static final String route = '/additive_list';

  @override
  _AdditiveListState createState() {
    return _AdditiveListState();
  }
}

class _AdditiveListState extends State<AdditiveListScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        onInitialBuild: (Store<AppState> store) =>
            store.dispatch(LoadAdditivesAction(store)),
        builder: (BuildContext context, Store<AppState> store) {
          return StoreConnector<AppState, AdditiveListState>(
              converter: (store) => store.state.additiveListState,
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state.error != null) {
                  return RaisedButton(
                    child: Text(state.error.toString()),
                    onPressed: () {
                      store.dispatch(LoadAdditivesAction(store));
                    },
                  );
                } else {
                  return ListView.builder(
                      itemCount: state.additives.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildListItem(state.additives, index);
                      });
                }
              });
        });
  }

  Widget buildListItem(List<Additive> additives, int index) {
    return InkWell(
        child: Container(
            margin: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 8, bottom: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(additives[index].name),
              Text(additives[index].synonym),
            ])),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AdditiveDetailsScreen(additive: additives[index]),
            ),
          );
        });
  }
}
