import 'package:flutter/material.dart';
import 'package:movieapp/screens/screens.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeIndex = 0;

  final pages = <Widget>[
    MoviesPage(),
    TransactionsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeIndex,
        onTap: ((value) => {
              setState(() {
                activeIndex = value;
              })
            }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
