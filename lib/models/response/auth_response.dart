import 'package:movieapp/models/models.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:equatable/equatable.dart';

class AuthDataResponse extends Equatable {
  const AuthDataResponse({required this.token, required this.user});

  factory AuthDataResponse.fromJson(Map<String, dynamic> json) {
    return AuthDataResponse(
      token: StringParser.parse(json['token']),
      user: User.fromJson(json['user']),
    );
  }

  final String token;
  final User user;

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user.toJson(),
    };
  }

  @override
  List<Object?> get props => [token, user];
}
