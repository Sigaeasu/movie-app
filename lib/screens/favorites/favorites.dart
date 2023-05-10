import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  static const routeName = '/favorites';

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorites"),
        ),
        body: DefaultTabController(
            length: 6,
            child: Center(
              child: Column(children: <Widget>[
                SizedBox(height: 20),
                ButtonsTabBar(
                  backgroundColor: Colors.blue.shade200,
                  borderColor: Colors.blue,
                  borderWidth: 1,
                  unselectedBackgroundColor: Colors.white,
                  unselectedBorderColor: Colors.grey.shade400,
                  unselectedLabelStyle: const TextStyle(color: Colors.blue),
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  controller: _tabController,
                  onTap: (index) {
                    // switch (index) {
                    //   case 0:
                    //     widget.onTap('now_playing');
                    //     break;
                    //   case 1:
                    //     widget.onTap('upcoming');
                    //     break;
                    //   case 2:
                    //     widget.onTap('popular');
                    //     break;
                    //   default:
                    //     widget.onTap('');
                    //     break;
                    // }
                  },
                  tabs: [
                    const Tab(
                      text: "To Pay ",
                      icon: Icon(Icons.shopping_cart_outlined),
                    ),
                    const Tab(
                      text: "Active Ticket",
                      icon: Icon(Icons.movie_outlined),
                    ),
                    const Tab(
                      text: "History",
                      icon: Icon(Icons.history_edu_outlined),
                    ),
                  ],
                ),
              ]),
            )));
  }
}
