import 'package:additive_food/features/app/app_state.dart';
import 'package:additive_food/features/profle/profile_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'profile_state.dart';

class ProfileScreen extends StatefulWidget {
  static final String route = "/profile";

  @override
  _ProfileScreenState createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
        onInitialBuild: (Store<AppState> store) =>
            store.dispatch(LoadProfileAction(store)),
        builder: (BuildContext context, Store<AppState> store) {
          return StoreConnector<AppState, ProfileState>(
              converter: (store) => store.state.profileState,
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (!state.isLoading && state.user == null) {
                  return Center(
                      child: FlatButton(
                    color: Theme.of(context).accentColor,
                    child: Text("You Don't have an account?"),
                    onPressed: null,
                  ));
                }
              });
        });
  }
}
