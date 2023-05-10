import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/screens/movies/sections/balanceSection.dart';
import 'package:movieapp/screens/movies/sections/movieSliderSection.dart';

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
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => const Card(
                child: Center(child: Text('Dummy Card Text')),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
