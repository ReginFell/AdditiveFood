import 'dart:async';

import 'package:additive_food/core/app_theme_widget.dart';
import 'package:additive_food/features/additive/list/additive_list_screen.dart';
import 'package:additive_food/features/home/home_navigator.dart';
import 'package:additive_food/features/profle/profile_screen.dart';
import 'package:additive_food/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    Page(3, "/12321212", GlobalKey<NavigatorState>(), (_) => Text("sss")),
    Page(4, ProfileScreen.route, GlobalKey<NavigatorState>(),
        (_) => ProfileScreen()),
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
      title: Text(AppLocalizations.of(context).title),
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
    final accentColor = ThemeContainer.of(context).colorAccent;
    final highlightColor = ThemeContainer.of(context).colorAccentSecondary;
    final localization = AppLocalizations.of(context);
    final iconHeight = ThemeContainer.of(context).bottomMenuIconHeight;

    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _currentPage,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/menu.svg",
              height: iconHeight,
              color: accentColor,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/menu.svg",
              height: iconHeight,
              color: highlightColor,
            ),
            title: Text(localization.additiveList)),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              height: iconHeight,
              color: accentColor,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/search.svg",
              height: iconHeight,
              color: highlightColor,
            ),
            title: Text("Добавки")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/camera.svg",
              height: iconHeight,
              color: accentColor,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/camera.svg",
              height: iconHeight,
              color: highlightColor,
            ),
            title: Text("Поиск", style: Theme.of(context).textTheme.body1)),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/favorite.svg",
              height: iconHeight,
              color: accentColor,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/favorite.svg",
              height: iconHeight,
              color: highlightColor,
            ),
            title: Text("Избранное", style: Theme.of(context).textTheme.body1)),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/profile.svg",
              height: iconHeight,
              color: accentColor,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/profile.svg",
              height: iconHeight,
              color: highlightColor,
            ),
            title: Text("Профиль", style: Theme.of(context).textTheme.body1)),
      ],
      onTap: (index) {
        _openPage(index);
      },
    );
  }
}
