import 'package:additive_food/core/app_theme_widget.dart';
import 'package:additive_food/features/app/app_state.dart';
import 'package:additive_food/features/profle/profile_actions.dart';
import 'package:additive_food/localization/localization.dart';
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
                  return buildLogin(context);
                }
              });
        });
  }

  Widget buildLogin(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final hintColor = ThemeContainer.of(context).hintColor;
    final underlineColor = ThemeContainer.of(context).textFieldUnderlineColor;

    return Center(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: 'login',
                  hintStyle: TextStyle(color: hintColor),
                  labelStyle: TextStyle(decorationColor: underlineColor),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: underlineColor)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: underlineColor))),
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: TextStyle(color: hintColor),
                    labelStyle: TextStyle(decorationColor: underlineColor),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: underlineColor)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: underlineColor)))),
          ],
        ),
      ),
    );
  }
}
