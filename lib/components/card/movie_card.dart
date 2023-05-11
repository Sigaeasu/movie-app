import 'package:flutter/material.dart';
import 'package:movieapp/models/models.dart';
import 'package:movieapp/utils/string_parser.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({
    Key? key,
    this.onTap,
    required this.movie,
  }) : super(key: key);

  final Movies movie;
  final VoidCallback? onTap;

  @override
  State<MovieCard> createState() => _MovieCard();
}

class _MovieCard extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300))),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500' + widget.movie.image,
                    width: 150,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Container(
                      // decoration: BoxDecoration(color: Colors.cyan),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.movie.title,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),
                              const SizedBox(width: 5),
                              Text(
                                  StringParser.parse(widget.movie.voteAverage)),
                              const SizedBox(width: 10),
                              Icon(Icons.calendar_month_outlined,
                                  color: Colors.blue[200], size: 20),
                              const SizedBox(width: 5),
                              Text(widget.movie.releaseDate),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(widget.movie.overview),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
