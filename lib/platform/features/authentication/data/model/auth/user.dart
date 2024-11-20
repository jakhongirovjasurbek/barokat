import 'package:barokat/platform/features/authentication/domain/enttiy/auth_user/user.dart';

final class AuthUserModel extends AuthUserEntity {
  const AuthUserModel({
    required super.fullName,
    required super.phoneNumber,
    required super.passcode,
    required super.avatar,
    required super.email,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
      passcode: json['passcode'],
      avatar: json['avatar'],
      email: json['email'],
    );
  }
}
