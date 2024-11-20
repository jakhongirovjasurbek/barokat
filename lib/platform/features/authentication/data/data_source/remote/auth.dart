import 'package:barokat/core/exception/exception.dart';
import 'package:barokat/core/singletons/dio_settings.dart';
import 'package:barokat/platform/core/network/endpoints.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> verifyPhoneNumber({required String phone, required String code});

  Future<void> sendPhoneNumber({required String phone});

  Future<Map<String, dynamic>> authenticate();
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
  Future<void> verifyPhoneNumber({
    required String phone,
    required String code,
  }) async {
    try {
      var response = await dio.get(
        "/api/user/confirm-phone-verification",
      );
    } catch (error) {
      throw ServerException(statusMessage: '$error', statusCode: 400);
    }
  }

  @override
  Future<Map<String, dynamic>> authenticate() async {
    try {
      final response = await dio.get(PlatformEndpoints.user);

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
}
