part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final User? user;
  final AuthenticationStatus status;

  const AuthenticationState._(
      {this.status = AuthenticationStatus.unknown, this.user});

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  @override
  // TODO: implement props
  List<Object?> get props => [user, status];
}
