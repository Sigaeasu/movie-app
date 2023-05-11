import 'dart:developer';
import 'package:movieapp/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/utils/utils.dart';
import '../../models/models.dart';

part 'movies_state.dart';
part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc({required this.service}) : super(const MoviesState()) {
    on<MoviesFetched>(onFetchListData);
    on<MoviesRefreshed>(onRefreshData);
    on<MoviesDetailFetched>(onFetchDetailData);
    on<MoviesDetailRefreshed>(onRefreshDetailData);
  }

  final MoviesService service;

  Future onFetchListData(
    MoviesFetched event,
    Emitter<MoviesState> emit,
  ) async {
    try {
      if (event.params != state.params ||
          state.status != MoviesBlocStatus.success) {
        emit(
          state.copyWith(
            status: MoviesBlocStatus.loading,
            params: event.params,
          ),
        );

        final result = await onFetchListDataUnHandleError(
            params: event.params, emit: emit);

        emit(
          state.copyWith(
            status: MoviesBlocStatus.success,
            listData: result,
          ),
        );
      }
    } catch (error, stackTrace) {
      log(
        stackTrace.toString(),
        stackTrace: stackTrace,
        error: error,
        name: 'ERROR',
      );
      if (error is ErrorException) {
        emit(
          state.copyWith(
            status: MoviesBlocStatus.failure,
            failure: error,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: MoviesBlocStatus.failure,
            failure: ErrorCodeException(message: error.toString()),
          ),
        );
      }
    }
  }

  Future onRefreshData(
    MoviesRefreshed event,
    Emitter<MoviesState> emit,
  ) async {
    final currentState = state;
    final newParams = currentState.params.copyWith(page: 1);

    try {
      emit(
        state.copyWith(
          status: MoviesBlocStatus.loading,
          params: newParams,
        ),
      );
      final result =
          await onFetchListDataUnHandleError(params: newParams, emit: emit);

      emit(
        state.copyWith(
          status: MoviesBlocStatus.success,
          listData: result,
        ),
      );
    } catch (error) {
      emit(currentState);
    }
  }

  Future onFetchDetailData(
    MoviesDetailFetched event,
    Emitter<MoviesState> emit,
  ) async {
    try {
      if (event.params != state.params ||
          state.status != MoviesBlocStatus.success) {
        emit(
          state.copyWith(
            status: MoviesBlocStatus.loading,
            params: event.params,
          ),
        );

        final result = await onFetchDetailDataUnHandleError(
            params: event.params, emit: emit);

        emit(
          state.copyWith(
            status: MoviesBlocStatus.success,
            detailData: result,
          ),
        );
      }
    } catch (error, stackTrace) {
      log(
        stackTrace.toString(),
        stackTrace: stackTrace,
        error: error,
        name: 'ERROR',
      );
      if (error is ErrorException) {
        emit(
          state.copyWith(
            status: MoviesBlocStatus.failure,
            failure: error,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: MoviesBlocStatus.failure,
            failure: ErrorCodeException(message: error.toString()),
          ),
        );
      }
    }
  }

  Future onRefreshDetailData(
    MoviesDetailRefreshed event,
    Emitter<MoviesState> emit,
  ) async {
    final currentState = state;
    final newParams = currentState.params.copyWith(page: 1);

    try {
      emit(
        state.copyWith(
          status: MoviesBlocStatus.loading,
          params: newParams,
        ),
      );
      final result =
          await onFetchDetailDataUnHandleError(params: newParams, emit: emit);

      emit(
        state.copyWith(
          status: MoviesBlocStatus.success,
          detailData: result,
        ),
      );
    } catch (error) {
      emit(currentState);
    }
  }

  Future<List<Movies>> onFetchListDataUnHandleError({
    required MoviesParams params,
    required Emitter<MoviesState> emit,
  }) async {
    final result = await service.getMovies(
      page: params.page,
      sort: params.sort ?? '',
    );
    return result;
  }

  Future<Movies> onFetchDetailDataUnHandleError({
    required MoviesParams params,
    required Emitter<MoviesState> emit,
  }) async {
    final result = await service.getMovieDetail(params.id ?? "");

    return result;
  }
}
