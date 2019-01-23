import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final String route = '/home';

  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Additive Food'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
      ),
    );
  }
}
