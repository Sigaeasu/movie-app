// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:formz/formz.dart';
import 'package:movieapp/models/models.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final CustomValidatorFormz<String> email;
  final MinLengthFormz password;
  final FormzStatus status;
  final ErrorException? failure;

  LoginState({
    required this.email,
    required this.password,
    this.status = FormzStatus.pure,
    this.failure,
  });

  LoginState.pure()
      : this(
          status: FormzStatus.pure,
          email: CustomValidatorFormz.pure(
            (value) => Validators.isValidEmail(value ?? ''),
          ),
          password: MinLengthFormz.pure(1),
        );

  @override
  List<Object?> get props => [email, password, status, failure];

  LoginState copyWith({
    CustomValidatorFormz<String>? email,
    MinLengthFormz? password,
    FormzStatus? status,
    ErrorException? failure,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}

extension LoginStateX on LoginState {
  LoginBody toPayload({String? movieDbToken}) {
    if (!status.isValidated) throw Exception('The Data is not valid');

    return LoginBody(
      email: email.value ?? '',
      password: password.value ?? '',
      movieDbToken: movieDbToken,
    );
  }
}
