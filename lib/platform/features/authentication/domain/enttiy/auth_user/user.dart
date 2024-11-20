base class AuthUserEntity {
  final String fullName;
  final String phoneNumber;
  final String passcode;
  final String? email;
  final String? avatar;

  const AuthUserEntity({
    required this.fullName,
    required this.phoneNumber,
    required this.passcode,
    this.email,
    this.avatar,
  });
}
