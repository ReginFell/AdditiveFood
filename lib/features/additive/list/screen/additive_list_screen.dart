import 'package:additive_food/data/adittive/model/additive.dart';
import 'package:additive_food/features/additive/list/action/additive_list_actions.dart';
import '../state/additive_list_state.dart';
import 'package:additive_food/features/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AdditiveListScreen extends StatefulWidget {
  static final String route = '/additive_list';

  @override
  AdditiveListWidgetState createState() {
    return new AdditiveListWidgetState();
  }
}

class AdditiveListWidgetState extends State<AdditiveListScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        onInit: (Store<AppState> store) => store.dispatch(loadAdditivesAction),
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
                      store.dispatch(loadAdditivesAction);
                    },
                  );
                } else {
                  return ListView.builder(
                      itemCount: state.additives.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return buildListItem(state.additives, index);
                      });
                }
              });
        });
  }

  Widget buildListItem(List<Additive> additives, int index) {
    return Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(additives[index].id),
          Text(additives[index].name),
        ]));
  }
}
