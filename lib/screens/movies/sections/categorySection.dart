import 'package:flutter/material.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  List<Map<String, dynamic>> genre = [
    {
      'id': 1,
      'name': 'Action',
    },
    {
      'id': 2,
      'name': 'Comedy',
    },
    {
      'id': 3,
      'name': 'Drama',
    },
    {
      'id': 4,
      'name': 'Horror',
    },
    {
      'id': 5,
      'name': 'Romance',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 100.0,
        child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) => Card(
                  child: Container(
                      width: 100,
                      padding: EdgeInsets.all(10),
                      child: Center(child: Text(genre[index]['name']))),
                )),
      ),
    );
  }
}
