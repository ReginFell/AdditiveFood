import 'package:additive_food/features/home/home_navigator.dart';

import '../additive/list/screen/additive_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  static final String route = '/home';

  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final List<Page> _pages = [
    Page(0, "/2", GlobalKey<NavigatorState>(), (context) => Text("Hello")),
    Page(1, AdditiveListScreen.route, GlobalKey<NavigatorState>(),
        (context) => AdditiveListScreen()),
    Page(2, "/123", GlobalKey<NavigatorState>(), (context) => Text("21")),
    Page(3, AdditiveListScreen.route, GlobalKey<NavigatorState>(),
            (context) => AdditiveListScreen()),
  ];

  int _currentPage = 1;

  void _openPage(index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(context),
        bottomNavigationBar: buildBottomNavigation(context));
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
