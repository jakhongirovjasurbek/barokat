abstract final class PlatformEndpoints {
  /// Requst method [POST]
  /// Request endpoint: /user/signup
  /// Example value:
  ///
  /// {
  ///   "full_name": "John Doe",
  ///   "phone_number": "+998901234567"
  /// }
  ///
  /// Success value:
  ///
  /// {
  ///   "status_code": 200,
  ///   "message": "success",
  ///   "data": 123456
  /// }
  ///
  /// Exception value:
  ///
  /// {
  ///   "status_code": 400,
  ///   "message": "Error on generate OTP"
  /// }
  static const String signup = '/user/signup';

  /// Requst method [POST]
  /// Request endpoint: /user/login
  /// Example value:
  ///
  /// {
  ///   "full_name": "John Doe",
  ///   "phone_number": "+998901234567"
  /// }
  ///
  /// Success value:
  ///
  /// {
  ///   "status_code": 200,
  ///   "message": "success",
  ///   "data": 123456
  /// }
  ///
  /// Exception value:
  ///
  /// {
  ///   "status_code": 400,
  ///   "message": "Error on generate OTP"
  /// }
  static const String login = '/user/signin';

  /// Requst method [POST]
  /// Request endpoint: /user/signup-confirm
  /// Example value:
  ///
  ///  {
  ///   "phone_number": "+998901234567",
  ///   "otp": 123456
  /// }
  ///
  /// Success value:
  ///
  /// {
  ///  "status_code": 201,
  ///   "message": "success",
  ///   "data": {
  ///    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9eyJpZCI6IjRkMGJ",
  ///     "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9eyJpZCI6IjRkMGJ"
  ///   }
  /// }
  ///
  /// Exception value:
  ///
  /// {
  ///   "status_code": 400,
  ///   "message": "OTP expired or invalid phone number"
  /// }
  static const String signupConfirm = '/user/signup-confirm';

  /// Requst method [POST]
  /// Request endpoint: /user/passcode
  /// Request value:
  ///
  /// {
  ///   "phone_number": "+998901234567",
  ///   "passcode": 1234
  /// }
  ///
  /// Success value:
  ///
  /// {
  ///   "status_code": 200,
  ///   "message": "success",
  ///   "data": {
  ///     "id": "b2d4aa27-0768-4456-947f-f8930c294394",
  ///     "is_deleted": false,
  ///     "created_at": "1730288822952",
  ///     "updated_at": "1730288797974",
  ///     "deleted_at": null,
  ///     "full_name": "John Doe",
  ///     "phone_number": "+998901234568",
  ///     "passcode": "1234",
  ///     "email": null,
  ///     "image": null
  ///   }
  /// }
  ///
  /// Exception value:
  ///
  /// {
  ///    "status_code": 400,
  ///    "message": "Error on creating passcode"
  /// }
  static const String createPasscode = '/user/passcode';

  /// Requst method [GET]
  /// Request endpoint: /user
  ///
  /// Success value:
  ///
  /// {
  ///   "status_code": 200,
  ///   "message": "success",
  ///   "data": {
  ///     "id": "b2d4aa27-0768-4456-947f-f8930c294394",
  ///     "is_deleted": false,
  ///     "created_at": "1730288822952",
  ///     "updated_at": "1730288797974",
  ///     "deleted_at": null,
  ///     "full_name": "John Doe",
  ///     "phone_number": "+998901234568",
  ///     "passcode": "1234",
  ///     "email": null,
  ///     "image": null
  ///   }
  /// }
  ///
  /// Exception value:
  ///
  /// {
  ///    "status_code": 400,
  ///    "message": "Error on creating passcode"
  /// }
  static const String user = '/user';

  /// Requst method [POST]
  /// Request endpoint: /user/signin-confirm
  /// Example value:
  ///
  ///  {
  ///   "phone_number": "+998901234567",
  ///   "otp": 123456
  /// }
  ///
  /// Success value:
  ///
  /// {
  ///  "status_code": 201,
  ///   "message": "success",
  ///   "data": {
  ///    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9eyJpZCI6IjRkMGJ",
  ///     "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9eyJpZCI6IjRkMGJ"
  ///   }
  /// }
  ///
  /// Exception value:
  ///
  /// {
  ///   "status_code": 400,
  ///   "message": "OTP expired or invalid phone number"
  /// }
  static const String signinConfirm = '/user/signin-confirm';

  static const String deleteAccount = '/user';

  static const String logout = '/user/signout';
}
