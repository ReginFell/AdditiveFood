import 'package:additive_food/features/additive/additive_list_actions.dart';
import 'package:additive_food/features/additive/additive_list_state.dart';
import 'package:additive_food/features/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AdditiveListScreen extends StatefulWidget {
  @override
  AdditiveListWidgetState createState() {
    return new AdditiveListWidgetState();
  }
}

class AdditiveListWidgetState extends State<AdditiveListScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        onInit: (Store<AppState> store) => store.dispatch(loadPosts),
        builder: (BuildContext context, Store<AppState> store) {
          return StoreConnector<AppState, AdditiveListState>(
              converter: (store) => store.state.additiveListState,
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      itemCount: state.additives.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Container(
                            margin: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.additives[index].id),
                                  Text(state.additives[index].name),
                                ]));
                      });
                }
              });
        });
  }
}
