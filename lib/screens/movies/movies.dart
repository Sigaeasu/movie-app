import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/blocs/blocs.dart';
import 'package:movieapp/screens/movies/sections/balanceSection.dart';
import 'package:movieapp/screens/movies/sections/categorySection.dart';
import 'package:movieapp/screens/movies/sections/movieSliderSection.dart';
import 'package:movieapp/screens/movies/sections/nowPlayingSection.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);
  static const routeName = '/movies';

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final moviesBloc = GetIt.I<MoviesBloc>();

  @override
  void initState() {
    super.initState();
    onFetchData('now_playing');
  }

  void onFetchData(String? sortFilter) {
    moviesBloc.add(MoviesFetched(
      params: MoviesParams(
        page: 1,
        sort: sortFilter,
      ),
    ));
  }

  void onRefreshData() {
    moviesBloc.add(MoviesRefreshed());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => moviesBloc,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Movies"),
            ),
            body: BlocListener<MoviesBloc, MoviesState>(
                listener: (context, state) {
              //
            }, child: BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: () async {
                    onRefreshData();
                  },
                  child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
                      if (state.status == MoviesBlocStatus.success) ...[
                        ImageSliderSection(movies: state.listData),
                        BalanceSection(),
                        Container(
                            alignment: Alignment.centerLeft,
                            margin:
                                EdgeInsets.only(left: 20, bottom: 10, top: 20),
                            child: Text('Category',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        CategorySection(),
                        Container(
                            alignment: Alignment.centerLeft,
                            margin:
                                EdgeInsets.only(left: 20, bottom: 10, top: 20),
                            child: Text('Now Playing',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        NowPlayingSection(
                          movies: state.listData,
                        ),
                        SizedBox(height: 20),
                      ],
                    ]),
                  ),
                );
              },
            ))));
  }
}
