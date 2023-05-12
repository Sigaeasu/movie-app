import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:movieapp/screens/screens.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  static const routeName = '/transactions';

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool isLoading = false;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Transactions"),
        ),
        body: DefaultTabController(
            length: 6,
            child: SingleChildScrollView(
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
                    onTap: (index) async {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(Duration(milliseconds: 500), () {});
                      setState(() {
                        isLoading = false;
                      });
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
                  Container(
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    height: 400,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isLoading) ...[
                          CircularProgressIndicator(),
                        ],
                        if (!isLoading) ...[
                          Icon(
                            Icons.local_movies_outlined,
                            size: 140,
                            color: Colors.blue.shade400,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "You haven't purchased any ticket",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          ElevatedButton(
                            child: Text(
                              'Purchase Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(MoviesPage.routeName);
                            },
                          ),
                        ]
                      ],
                    )),
                  ),
                ]),
              ),
            )));
  }
}
