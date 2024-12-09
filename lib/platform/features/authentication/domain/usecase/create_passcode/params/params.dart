class CreatePasscodeParams {
  final String passcode;
  final String phone;
  final String fullName;

  const CreatePasscodeParams({
    required this.fullName,
    required this.passcode,
    required this.phone,
  });
}
