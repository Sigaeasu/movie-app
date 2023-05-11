import 'dart:developer';

import '../../services/auth_service.dart';
import '../../utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.service}) : super(LoginState.pure());
  final AuthService service;

  void emailChanged(String value) {
    final email = state.email.dirty(value);
    state.failure?.details?.remove('email');

    _validateState(state.copyWith(email: email));
  }

  void passwordChanged(String value) {
    final password = state.password.dirty(value);
    state.failure?.details?.remove('password');

    _validateState(state.copyWith(password: password));
  }

  void validateFields() {
    _validateState(
      state.copyWith(
        email: state.email.dirty(state.email.value),
        password: state.password.dirty(state.password.value),
      ),
    );
  }

  // Method to validate all fields
  void _validateState(LoginState state) {
    emit(
      state.copyWith(
        email: state.email,
        password: state.password,
        status: Formz.validate([state.email, state.password]),
      ),
    );
  }

  Future submitted() async {
    try {
      if (!state.status.isValidated) return;
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final data = await service.login(state.toPayload());

      if (data.token.isNotEmpty) {
        emit(
          state.copyWith(status: FormzStatus.submissionSuccess),
        );
      } else {
        await service.logout();
        emit(state.copyWith(status: FormzStatus.invalid));
      }
    } on ErrorException catch (e) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          failure: e,
        ),
      );
    } catch (error, stackTrace) {
      log(
        stackTrace.toString(),
        stackTrace: stackTrace,
        error: error,
        name: 'ERROR',
      );
      if (error is ErrorException) {
        emit(
          state.copyWith(failure: error, status: FormzStatus.submissionFailure),
        );
      } else {
        emit(
          state.copyWith(
            failure: ErrorCodeException(message: error.toString()),
            status: FormzStatus.submissionFailure,
          ),
        );
      }
    }
  }
}
