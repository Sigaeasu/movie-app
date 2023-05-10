import 'package:equatable/equatable.dart';

class LoginBody extends Equatable {
  final String email;
  final String password;
  final String? movieDbToken;

  LoginBody({
    required this.email,
    required this.password,
    this.movieDbToken,
  });

  @override
  List<Object?> get props => [email, password, movieDbToken];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'moviedb_token': movieDbToken,
    };
  }
}
