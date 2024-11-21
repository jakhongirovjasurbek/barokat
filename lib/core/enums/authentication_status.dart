enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  redirected;

  bool get isAuthenticated => this == authenticated;

  bool get isUnauthenticated => this == unauthenticated;
}
