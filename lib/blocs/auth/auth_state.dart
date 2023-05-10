part of 'auth_cubit.dart';

enum AuthenticationStatus { unknow, authenticated, unAuthenticated }

class AuthState extends Equatable {
  const AuthState._({
    this.status = AuthenticationStatus.unknow,
    this.user,
  });

  /// Unknown state
  const AuthState.unknow() : this._();

  /// Authenticated state
  const AuthState.authenticated(User staff)
      : this._(user: staff, status: AuthenticationStatus.authenticated);

  /// UnAuthenticated state
  const AuthState.unAuthenticated()
      : this._(
          status: AuthenticationStatus.unAuthenticated,
          user: null,
        );

  final User? user;
  final AuthenticationStatus status;

  @override
  List<Object?> get props => [user, status];
}
