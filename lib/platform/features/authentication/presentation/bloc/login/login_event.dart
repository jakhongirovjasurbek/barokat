part of 'login_bloc.dart';

sealed class LoginEvent {
  const LoginEvent();
}

class LoginPrivacyAgreementTapped extends LoginEvent {
  const LoginPrivacyAgreementTapped();
}

class LoginSendCodeButtonTapped extends LoginEvent {
  final String phoneNumber;
  final String fullName;
  final VoidCallback onSuccess;

  const LoginSendCodeButtonTapped({
    required this.phoneNumber,
    required this.fullName,
    required this.onSuccess,
  });
}

class LoginSignInSendCodeButtonTapped extends LoginEvent {
  final String phoneNumber;
  final VoidCallback onSuccess;

  const LoginSignInSendCodeButtonTapped({
    required this.phoneNumber,
    required this.onSuccess,
  });
}

class LoginOTPContinueButtonTapped extends LoginEvent {
  final String otp;
  final VoidCallback onSuccess;

  const LoginOTPContinueButtonTapped({
    required this.otp,
    required this.onSuccess,
  });
}

class LoginSignInOTPContinueButtonTapped extends LoginEvent {
  final String otp;
  final VoidCallback onSuccess;

  const LoginSignInOTPContinueButtonTapped({
    required this.otp,
    required this.onSuccess,
  });
}

class LoginCreatePasscodeEvent extends LoginEvent {
  final String passcode;
  final VoidCallback onSuccess;

  const LoginCreatePasscodeEvent({
    required this.passcode,
    required this.onSuccess,
  });
}
