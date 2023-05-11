import 'package:carousel_slider/carousel_slider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/blocs/blocs.dart';
import 'package:movieapp/models/models.dart';
import 'package:movieapp/utils/string_parser.dart';

class MovieDetailArgument extends Equatable {
  String id;
  String name;
  List<Movies> recommendations;

  MovieDetailArgument(
      {required this.id, required this.name, required this.recommendations});

  @override
  List<Object?> get props => [id, name, recommendations];
}

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  static const routeName = '/movie/detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    assert(args is MovieDetailArgument);
    String id = (args as MovieDetailArgument).id;
    String name = (args as MovieDetailArgument).name;
    List<Movies> recommendations =
        (args as MovieDetailArgument).recommendations;

    return MovieDetailViewPage(
      id: id,
      name: name,
      recommendations: recommendations,
    );
  }
}

class MovieDetailViewPage extends StatefulWidget {
  const MovieDetailViewPage({
    Key? key,
    required this.id,
    required this.name,
    required this.recommendations,
  }) : super(key: key);

  final String id;
  final String name;
  final List<Movies> recommendations;

  @override
  State<MovieDetailViewPage> createState() => _MovieDetailViewPageState();
}

class _MovieDetailViewPageState extends State<MovieDetailViewPage> {
  final moviesBloc = GetIt.I<MoviesBloc>();

  @override
  void initState() {
    super.initState();
    onFetchData();
  }

  void onFetchData() {
    moviesBloc.add(MoviesDetailFetched(
      params: MoviesParams(id: widget.id),
    ));
  }

  void onRefreshData() {
    moviesBloc.add(MoviesDetailRefreshed());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => moviesBloc,
        child: Scaffold(
          appBar: AppBar(title: Text(widget.name)),
          body: BlocListener<MoviesBloc, MoviesState>(listener:
              (context, state) {
            //
          }, child:
              BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                onRefreshData();
              },
              child: ListView(children: [
                if (state.status == MoviesBlocStatus.success) ...[
                  if (state.detailData != null) ...[
                    Center(
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500' +
                            state.detailData!.image,
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Wrap(spacing: 5, runSpacing: 5, children: [
                      if (state.detailData?.genres != null) ...[
                        for (var genre in state.detailData!.genres!)
                          Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 225, 225, 225),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                    bottom: Radius.circular(10),
                                  )),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(genre.name))
                      ]
                    ]),
                  ),
                  const SizedBox(height: 10),
                  Row(children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          StringParser.parse(state.detailData?.runTime) +
                              ' Minutes',
                          style: TextStyle(color: Colors.grey)),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(Icons.circle,
                            color: Colors.grey[400], size: 10)),
                    Container(
                        padding: EdgeInsets.only(top: 0, left: 10),
                        child: Icon(Icons.star,
                            color: Colors.yellow[400], size: 20)),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                          StringParser.parse(state.detailData?.voteAverage) +
                              ' / 10 by IMDB',
                          style: TextStyle(color: Colors.grey)),
                    )
                  ]),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(state.detailData?.overview ?? ''),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: const Text(
                        'You Might Also Like',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  CarouselSlider(
                    items: [
                      for (var data in widget.recommendations.take(5)) ...[
                        InkWell(
                          onTap: () => Navigator.of(context).pushNamed(
                            MovieDetailPage.routeName,
                            arguments: MovieDetailArgument(
                                id: data.id,
                                name: data.title,
                                recommendations: widget.recommendations),
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                'https://image.tmdb.org/t/p/w500' + data.image,
                                width: 150,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                data.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        )
                      ]
                    ],
                    options: CarouselOptions(
                      height: 400.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.5,
                    ),
                  )
                ],
                if (state.status == MoviesBlocStatus.loading) ...[
                  const SizedBox(height: 150),
                  const Center(child: CircularProgressIndicator())
                ]
              ]),
            );
          })),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: Text(
                      'Buy Ticket(s)',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
