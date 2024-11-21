import 'package:barokat/core/exception/exception.dart';
import 'package:barokat/core/singletons/dio_settings.dart';
import 'package:barokat/platform/core/network/endpoints.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/confirm_phone/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/create_passcode/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/signup/params/params.dart';
import 'package:dio/dio.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Map<String, dynamic>> verifyPhoneNumber(ConfirmPhoneParams query);

  Future<void> sendPhoneNumber({required String phone});

  Future<Map<String, dynamic>> authenticate();

  Future<Map<String, dynamic>> signup(SignupParams query);

  Future<Map<String, dynamic>> createPasscode(CreatePasscodeParams query);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final dio = DioSettings().dio;

  @override
  Future<void> sendPhoneNumber({required String phone}) async {
    try {
      await dio.post(PlatformEndpoints.signup);
    } catch (error) {
      throw ServerException(statusMessage: '$error', statusCode: 400);
    }
  }

  @override
  Future<Map<String, dynamic>> verifyPhoneNumber(
      ConfirmPhoneParams query) async {
    try {
      print('Came here 3');
      var response = await dio.post(
        query.isLogin
            ? PlatformEndpoints.signinConfirm
            : PlatformEndpoints.signupConfirm,
        data: {
          'phone_number': query.phone,
          'otp': int.parse(query.code),
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print('Response 2: ${response.data}');
        return response.data;
      }

      print('Response 4; ${response.data}');
      throw ServerException(
        statusMessage: response.data['error']['message'],
        statusCode: response.data['status_code'],
      );
    } catch (error) {
      print('Error case $error');
      throw ServerException(statusMessage: '$error', statusCode: 400);
    }
  }

  @override
  Future<Map<String, dynamic>> authenticate() async {
    try {
      print('Authentication in process');
      final response = await dio.get(PlatformEndpoints.user);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      }

      print('Headers: ${response.requestOptions.headers}');
      throw ServerException(
        statusMessage: response.data['error']['message'],
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
  Future<Map<String, dynamic>> signup(SignupParams query) async {
    try {
      final response = await dio.post(
        PlatformEndpoints.signup,
        data: {
          'full_name': query.fullName,
          'phone_number': query.phoneNumber,
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      }

      throw ServerException(
        statusMessage: response.data['error']['message'],
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

      print('Headers: ${response.requestOptions.headers}');
      throw ServerException(
        statusMessage: response.data['error']['message'],
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
}
