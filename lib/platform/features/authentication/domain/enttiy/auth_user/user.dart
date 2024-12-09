base class AuthUserEntity {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String passcode;
  final String? email;
  final String? image;

  const AuthUserEntity({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.passcode,
    this.email,
    this.image,
  });

  @override
  String toString() =>
      'AuthUserEntity{id: $id, fullName: $fullName, phoneNumber: $phoneNumber, passcode: $passcode, email: $email, image: $image}';
}
