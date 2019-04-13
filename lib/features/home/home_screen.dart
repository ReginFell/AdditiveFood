import 'dart:async';

import 'package:additive_food/features/additive/list/additive_list_screen.dart';
import 'package:additive_food/features/home/home_navigator.dart';
import 'package:additive_food/localization/localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final String route = '/home';

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Page> _pages = [
    Page(0, AdditiveListScreen.route, GlobalKey<NavigatorState>(),
        (_) => AdditiveListScreen()),
    Page(1, "/12345", GlobalKey<NavigatorState>(), (_) => Text("1233")),
    Page(2, "/123", GlobalKey<NavigatorState>(), (_) => Text("21")),
    Page(3, "/1234", GlobalKey<NavigatorState>(), (_) => Text("last")),
  ];

  int _currentPage = 0;

  void _openPage(index) {
    setState(() {
      _currentPage = index;
    });
  }

  Future<bool> _willPopCallback() async {
    return !await _pages[_currentPage].navigator.currentState.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _willPopCallback,
        child: Scaffold(
            appBar: buildAppBar(context),
            body: buildBody(context),
            bottomNavigationBar: buildBottomNavigation(context)));
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Additive Food'),
      elevation: 0.0,
    );
  }

  Widget buildBody(BuildContext context) {
    return Stack(
        children: _pages.map((page) => _buildOffstageNavigator(page)).toList());
  }

  Widget _buildOffstageNavigator(Page page) {
    return Offstage(
      offstage: _currentPage != page.index,
      child: HomeNavigator(page),
    );
  }

  Widget buildBottomNavigation(BuildContext context) {
    final accentColor = Theme.of(context).accentColor;
    final localization = AppLocalizations.of(context);

    return BottomNavigationBar(
      currentIndex: _currentPage,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: accentColor,
            ),
            title: Text(localization.additiveList,
                style: Theme.of(context).textTheme.body1)),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
              color: accentColor,
            ),
            title: Text("Добавки", style: Theme.of(context).textTheme.body1)),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: accentColor,
            ),
            title: Text("Поиск", style: Theme.of(context).textTheme.body1)),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: accentColor,
            ),
            title: Text("Профиль", style: Theme.of(context).textTheme.body1)),
      ],
      onTap: (index) {
        _openPage(index);
      },
    );
  }
}
