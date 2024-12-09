import 'package:barokat/core/exception/exception.dart';
import 'package:barokat/core/singletons/dio_settings.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:barokat/platform/core/network/endpoints.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/auth/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/confirm_phone/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/create_passcode/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/login/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/signup/params/params.dart';
import 'package:dio/dio.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Map<String, dynamic>> verifyPhoneNumber(ConfirmPhoneParams query);

  Future<Map<String, dynamic>> authenticate(AuthParams query);

  Future<Map<String, dynamic>> signup(SignupParams query);

  Future<Map<String, dynamic>> login(LoginParams query);

  Future<Map<String, dynamic>> createPasscode(CreatePasscodeParams query);

  Future<void> logout();

  Future<void> deleteAccount(String userId);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final dio = DioSettings().dio;

  @override
  Future<Map<String, dynamic>> authenticate(
    AuthParams query,
  ) async {
    try {
      final response = await dio.get(
        '${PlatformEndpoints.user}/${query.userId}',
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      }

      throw ServerException(
        statusMessage: '${response.data['error']['message']}',
        statusCode: response.data['status_code'],
      );
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(
        statusMessage: AppLocalization.current.failed_to_auth,
        statusCode: 400,
      );
    }
  }

  @override
  Future<Map<String, dynamic>> signup(SignupParams query) async {
    try {
      final response = await dio.post(
        options: Options(headers: {'without_token': true}),
        PlatformEndpoints.signup,
        data: {'phone_number': query.phoneNumber},
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      }

      throw ServerException(
        statusMessage: '${response.data['error']['message']}',
        statusCode: response.data['status_code'],
      );
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(
        statusMessage: 'Failed to authenticate.',
        statusCode: 400,
      );
    }
  }

  @override
  Future<Map<String, dynamic>> createPasscode(
      CreatePasscodeParams query) async {
    try {
      final response = await dio.post(
        options: Options(headers: {'without_token': true}),
        PlatformEndpoints.createPasscode,
        data: {
          'full_name': query.fullName,
          'phone_number': query.phone,
          'passcode': query.passcode,
        },
      );

      print('Response status: ${response.statusCode}');
      print('URL: ${response.realUri}');
      print('Data: ${response.data}');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      }

      throw ServerException(
        statusMessage: '${response.data['error']['message']}',
        statusCode: response.data['status_code'],
      );
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(
        statusMessage: 'Failed to authenticate.',
        statusCode: 400,
      );
    }
  }

  @override
  Future<Map<String, dynamic>> login(LoginParams query) async {
    try {
      final response = await dio.post(
        PlatformEndpoints.login,
        data: {'phone_number': query.phoneNumber},
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      }

      throw ServerException(
        statusMessage: '${response.data['error']['message']}',
        statusCode: response.data['status_code'],
      );
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(
        statusMessage: 'Failed to authenticate.',
        statusCode: 400,
      );
    }
  }

  @override
  Future<Map<String, dynamic>> verifyPhoneNumber(
    ConfirmPhoneParams query,
  ) async {
    try {
      var response = await dio.post(
        query.isLogin
            ? PlatformEndpoints.signinConfirm
            : PlatformEndpoints.signupConfirm,
        options: Options(headers: {'without_token': true}),
        data: {
          'phone_number': query.phone,
          'otp': query.code,
        },
      );
      print(response.requestOptions.data);
      print('Response: ${response.data}');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      }

      throw ServerException(
        statusMessage: '${response.data['error']['message']}',
        statusCode: response.data['status_code'],
      );
    } catch (error) {
      throw ServerException(statusMessage: '$error', statusCode: 400);
    }
  }

  @override
  Future<void> deleteAccount(String userId) async {
    try {
      var response = await dio.delete(
        '${PlatformEndpoints.deleteAccount}/$userId',
        data: {'id': userId},
      );

      print(response.realUri);
      print(response.statusCode);
      print(response.requestOptions.headers);
      print(response.requestOptions.data);
      print('Response: ${response.data}');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      }

      throw ServerException(
        statusMessage: '${response.data['error']['message']}',
        statusCode: response.data['status_code'],
      );
    } catch (error) {
      throw ServerException(statusMessage: '$error', statusCode: 400);
    }
  }

  @override
  Future<void> logout() async {
    try {
      var response = await dio.post(PlatformEndpoints.logout);

      print(response.requestOptions.data);
      print('Response: ${response.data}');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      }

      throw ServerException(
        statusMessage: '${response.data['error']['message']}',
        statusCode: response.data['status_code'],
      );
    } catch (error) {
      throw ServerException(statusMessage: '$error', statusCode: 400);
    }
  }
}
