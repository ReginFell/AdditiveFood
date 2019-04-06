import 'dart:async';

import 'package:additive_food/features/home/home_navigator.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../additive/list/screen/additive_list_screen.dart';

class HomeScreen extends StatefulWidget {
  static final String route = '/home';

  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final List<Page> _pages = [
    Page(0, "/2", GlobalKey<NavigatorState>(), (_) => Text("Hello")),
    Page(1, AdditiveListScreen.route, GlobalKey<NavigatorState>(),
        (_) => AdditiveListScreen()),
    Page(2, "/123", GlobalKey<NavigatorState>(), (_) => Text("21")),
    Page(3, AdditiveListScreen.route, GlobalKey<NavigatorState>(),
        (_) => AdditiveListScreen()),
  ];

  int _currentPage = 1;

  void _openPage(index) {
    setState(() {
      _currentPage = index;
    });
  }

  //TODO at the moment this always requires to press backspace twice
  Future<bool> _willPopCallback() async {
    final currentNavigator = _pages[_currentPage].navigator;

    if (currentNavigator.currentState.canPop()) {
      currentNavigator.currentState.pop();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: buildAppBar(context),
            body: buildBody(context),
            bottomNavigationBar: buildBottomNavigation(context)),
        onWillPop: _willPopCallback);
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
      child: HomeNavigator(page: page),
    );
  }

  Widget buildBottomNavigation(BuildContext context) {
    var accentColor = Theme.of(context).accentColor;

    return BubbleBottomBar(
      opacity: .2,
      currentIndex: _currentPage,
      items: [
        BubbleBottomBarItem(
            backgroundColor: accentColor,
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color: accentColor,
            ),
            title: Text("Витамины")),
        BubbleBottomBarItem(
            backgroundColor: accentColor,
            icon: Icon(
              Icons.mail,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.mail,
              color: accentColor,
            ),
            title: Text("Добавки")),
        BubbleBottomBarItem(
            backgroundColor: accentColor,
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.search,
              color: accentColor,
            ),
            title: Text("Поиск")),
        BubbleBottomBarItem(
            backgroundColor: accentColor,
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.person,
              color: accentColor,
            ),
            title: Text("Профиль")),
      ],
      onTap: (index) {
        _openPage(index);
      },
    );
  }
}
