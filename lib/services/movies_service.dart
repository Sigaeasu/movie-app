// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:movieapp/models/models.dart';
import 'package:movieapp/utils/utils.dart';

abstract class MoviesService {
  Future<List<TVMovies>> getMovies({
    required int page,
    required String sort,
  });
  Future<TVMovies> getMovieDetail(String id);
}

class MoviesServiceImpl
    with ServiceNetworkHandlerMixin
    implements MoviesService {
  final Dio httpClient;
  MoviesServiceImpl({
    required this.httpClient,
  });

  @override
  Future<List<TVMovies>> getMovies({
    required int page,
    required String sort,
  }) async {
    String url = "/3/movie/";
    url += sort.toString();
    url += '?page=' + page.toString();

    return get<List<TVMovies>>(
      url,
      httpClient: httpClient,
      options: Options(headers: {'appVersion': '2'}),
      onSuccess: (response) async {
        return ((response.data['results'] ?? []) as List)
            .map((e) => TVMovies.fromMovieJson(e))
            .toList();
      },
    );
  }

  @override
  Future<TVMovies> getMovieDetail(String id) async {
    String url = "/3/movie/" + id;
    return get<TVMovies>(
      url,
      httpClient: httpClient,
      options: Options(headers: {'appVersion': '2'}),
      onSuccess: (response) async {
        return TVMovies.fromMovieJson(response.data);
      },
    );
  }
}
