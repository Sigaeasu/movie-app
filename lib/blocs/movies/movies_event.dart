// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class MoviesFetched extends MoviesEvent {
  final MoviesParams params;
  const MoviesFetched({
    required this.params,
  });
}

class MoviesRefreshed extends MoviesEvent {
  const MoviesRefreshed();
}

class MoviesDetailFetched extends MoviesEvent {
  final MoviesParams params;
  const MoviesDetailFetched({
    required this.params,
  });
}

class MoviesDetailRefreshed extends MoviesEvent {
  const MoviesDetailRefreshed();
}
