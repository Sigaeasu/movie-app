import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/blocs/blocs.dart';
import 'package:movieapp/components/components.dart';
import 'package:movieapp/components/skeletons/movie_list_skeleton.dart';
import 'package:movieapp/screens/screens.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);
  static const routeName = '/movies';

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
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
              title: const Text("Now Playing List"),
            ),
            body: BlocListener<MoviesBloc, MoviesState>(
                listener: (context, state) {
              //
            }, child: BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                if (state.status == MoviesBlocStatus.success) {
                  return RefreshIndicator(
                      onRefresh: () async {
                        onRefreshData();
                      },
                      child: InfiniteList(
                          itemCount: state.listData.length,
                          onFetchData: () {},
                          itemBuilder: (context, index) {
                            return MovieCard(
                              movie: state.listData[index],
                              onTap: () => Navigator.of(context).pushNamed(
                                MovieDetailPage.routeName,
                                arguments: MovieDetailArgument(
                                    id: state.listData[index].id,
                                    name: state.listData[index].title,
                                    recommendations: state.listData),
                              ),
                            );
                          }));
                } else if (state.status == MoviesBlocStatus.loading) {
                  return MoviesListSkeleton();
                } else {
                  return Container();
                }
              },
            ))));
  }
}
