String formatPhoneNumber(String phoneNumber) {
  // Remove any non-digit characters, except for the leading plus sign.
  final sanitizedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

  // Ensure the number starts with a "+" and has enough digits.
  if (!sanitizedNumber.startsWith('+') || sanitizedNumber.length != 13) {
    throw ArgumentError('Invalid phone number format');
  }

  // Extract the parts of the phone number.
  final countryCode = sanitizedNumber.substring(0, 4); // +###
  final areaCode = sanitizedNumber.substring(4, 6); // ##
  final part1 = sanitizedNumber.substring(6, 9); // ###
  final part2 = sanitizedNumber.substring(9, 11); // ##
  final part3 = sanitizedNumber.substring(11, 13); // ##

  // Format and return the phone number.
  return '$countryCode ($areaCode) $part1-$part2-$part3';
}
