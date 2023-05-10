import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/models.dart';
import '../../../../services/services.dart';
import 'package:movieapp/utils/utils.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.service}) : super(const AuthState.unknow());

  final AuthService service;

  Future initialize() async {
    try {
      final user = await service.currentUser();

      emit(AuthState.authenticated(user));
    } catch (error, stackTrace) {
      if (error is! NotFoundCacheException) {
        log(
          stackTrace.toString(),
          stackTrace: stackTrace,
          error: error,
          name: 'ERROR',
        );
      }

      emit(const AuthState.unAuthenticated());
    }
  }

  Future logout() async {
    try {
      await service.logout();
      emit(const AuthState.unAuthenticated());
    } catch (error, stackTrace) {
      log(
        stackTrace.toString(),
        stackTrace: stackTrace,
        error: error,
        name: 'ERROR',
      );
    }
  }
}

extension AuthCubitWithBuildContextX on BuildContext {
  User? get user => read<AuthCubit>().state.user;
}
