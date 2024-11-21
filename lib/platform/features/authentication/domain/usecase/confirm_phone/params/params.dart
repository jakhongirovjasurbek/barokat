class ConfirmPhoneParams {
  final String phone;
  final String code;
  final bool isLogin;

  const ConfirmPhoneParams({
    required this.phone,
    required this.code,
    required this.isLogin,
  });
}
