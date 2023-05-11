// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final MoviesParams params;
  final MoviesBlocStatus status;
  final ErrorException? failure;
  final List<TVMovies> listData;
  final TVMovies? detailData;
  const MoviesState({
    this.params = const MoviesParams(),
    this.status = MoviesBlocStatus.loading,
    this.failure,
    this.listData = const [],
    this.detailData,
  });

  @override
  List<Object?> get props => [params, status, failure, listData, detailData];

  MoviesState copyWith({
    MoviesParams? params,
    MoviesBlocStatus? status,
    ErrorException? failure,
    List<TVMovies>? listData,
    TVMovies? detailData,
  }) {
    return MoviesState(
      params: params ?? this.params,
      status: status ?? this.status,
      failure: failure ?? this.failure,
      listData: listData ?? this.listData,
      detailData: detailData ?? this.detailData,
    );
  }
}

enum MoviesBlocStatus { loading, success, failure }

class MoviesParams extends Equatable {
  final String? id;
  final int page;
  final String? sort;

  const MoviesParams({this.id, this.page = 1, this.sort});

  @override
  List<Object?> get props => [id, page, sort];

  MoviesParams copyWith({
    String? id,
    int? page,
    String? sort,
  }) {
    return MoviesParams(
      id: id ?? this.id,
      page: page ?? this.page,
      sort: sort ?? this.sort,
    );
  }
}
