import 'package:additive_food/features/additive/additive_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final String route = '/home';

  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final List<Widget> _tabs = [
    Text("Tab 1 "),
    AdditiveListScreen(),
    Text("Tab 2")
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
      appBar: AppBar(
        title: Text('Additive Food'),
      ),
      body: _tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Витамины'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Добавки'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Профиль'))
        ],
        onTap: (index) {
          _openPage(index);
        },
      ),
    );
  }
}
