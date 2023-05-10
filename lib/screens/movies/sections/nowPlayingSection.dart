import 'package:flutter/material.dart';

class NowPlayingSection extends StatefulWidget {
  const NowPlayingSection({super.key});

  @override
  State<NowPlayingSection> createState() => _NowPlayingSectionState();
}

class _NowPlayingSectionState extends State<NowPlayingSection> {
  List<Map<String, dynamic>> movies = [
    {
      'id': 1,
      'image':
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'name': 'Movie 1',
    },
    {
      'id': 2,
      'image':
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'name': 'Movie 2',
    },
    {
      'id': 3,
      'image':
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'name': 'Movie 3',
    },
    {
      'id': 4,
      'image':
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'name': 'Movie 4',
    },
    {
      'id': 5,
      'image':
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'name': 'Movie 5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 280.0,
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) => Card(
            child: Container(
              width: 200,
              child: Column(children: [
                Container(
                  height: 150.0,
                  child: Image.network(
                    movies[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  title: Text(movies[index]['name']),
                  subtitle: Text(movies[index]['name']),
                  // trailing: Icon(Icons.favorite_outline),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 5),
                      Text('7.0'),
                      const SizedBox(width: 10),
                      Icon(Icons.calendar_month_outlined,
                          color: Colors.blue[200], size: 20),
                      const SizedBox(width: 5),
                      Text('2020'),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
