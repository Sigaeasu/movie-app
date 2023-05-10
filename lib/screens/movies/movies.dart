import 'package:flutter/material.dart';
import 'package:movieapp/screens/movies/sections/balanceSection.dart';
import 'package:movieapp/screens/movies/sections/categorySection.dart';
import 'package:movieapp/screens/movies/sections/movieSliderSection.dart';
import 'package:movieapp/screens/movies/sections/nowPlayingSection.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  static const routeName = '/movies';

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          ImageSliderSection(),
          BalanceSection(),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, bottom: 10, top: 20),
              child: Text('Category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          CategorySection(),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, bottom: 10, top: 20),
              child: Text('Now Playing',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          NowPlayingSection(),
          SizedBox(height: 20),
        ]),
      ),
    );
  }
}
