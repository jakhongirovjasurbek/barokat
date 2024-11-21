part of 'login_bloc.dart';

class LoginState {
  final bool agreeWithPrivacyPolicy;
  final String fullName;
  final String phoneNumber;
  final LoadingStatus status;
  final Failure? failure;

  const LoginState({
    this.status = LoadingStatus.pure,
    this.agreeWithPrivacyPolicy = false,
    this.fullName = '',
    this.phoneNumber = '',
    this.failure,
  });

  LoginState copyWith({
    bool? agreeWithPrivacyPolicy,
    String? fullName,
    String? phoneNumber,
    LoadingStatus? status,
    Failure? failure,
  }) {
    return LoginState(
      agreeWithPrivacyPolicy:
          agreeWithPrivacyPolicy ?? this.agreeWithPrivacyPolicy,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      failure: failure,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginState &&
          runtimeType == other.runtimeType &&
          agreeWithPrivacyPolicy == other.agreeWithPrivacyPolicy &&
          fullName == other.fullName &&
          phoneNumber == other.phoneNumber &&
          status == other.status &&
          failure == other.failure;

  @override
  int get hashCode =>
      agreeWithPrivacyPolicy.hashCode ^
      fullName.hashCode ^
      phoneNumber.hashCode ^
      status.hashCode ^
      failure.hashCode;
}
