import 'package:barokat/platform/features/authentication/domain/enttiy/auth_user/user.dart';

final class AuthUserModel extends AuthUserEntity {
  const AuthUserModel({
    required super.id,
    required super.fullName,
    required super.phoneNumber,
    required super.passcode,
    required super.image,
    required super.email,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['id'],
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
      passcode: json['passcode'],
      image: json['image'],
      email: json['email'],
    );
  }
}
