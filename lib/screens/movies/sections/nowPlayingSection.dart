import 'package:flutter/material.dart';
import 'package:movieapp/models/models.dart';
import 'package:movieapp/screens/screens.dart';

class NowPlayingSection extends StatefulWidget {
  const NowPlayingSection({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movies> movies;

  @override
  State<NowPlayingSection> createState() => _NowPlayingSectionState();
}

class _NowPlayingSectionState extends State<NowPlayingSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 380.0,
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) => Card(
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed(
                MovieDetailPage.routeName,
                arguments: MovieDetailArgument(
                    id: widget.movies[index].id,
                    name: widget.movies[index].title,
                    recommendations: widget.movies),
              ),
              child: Container(
                width: 200,
                child: Column(children: [
                  Container(
                    width: 200,
                    height: 250.0,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500' +
                          widget.movies[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    title: Text(widget.movies[index].title),
                    subtitle: Text(
                      widget.movies[index].overview,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // trailing: Icon(Icons.favorite_outline),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        const SizedBox(width: 5),
                        Text(widget.movies[index].voteAverage.toString()),
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
      ),
    );
  }
}
