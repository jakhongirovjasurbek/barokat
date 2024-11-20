part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = const AuthUserEntity(
      fullName: '',
      phoneNumber: '',
      passcode: '',
    ),
    this.shouldNotRebuild = false,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(
    AuthUserEntity user, {
    bool dontRebuild = false,
  }) : this._(
          status: AuthenticationStatus.authenticated,
          user: user,
          shouldNotRebuild: dontRebuild,
        );

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.redirected(String shareLink, AuthUserEntity user)
      : this._(
          status: AuthenticationStatus.redirected,
          user: user,
        );

  final AuthenticationStatus status;
  final AuthUserEntity user;
  final bool shouldNotRebuild;

  @override
  List<Object> get props => [status, user, shouldNotRebuild];
}
