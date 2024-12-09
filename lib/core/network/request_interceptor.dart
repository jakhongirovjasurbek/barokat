import 'dart:io';

import 'package:barokat/packages/shared_preferences/storage_repository.dart';
import 'package:barokat/platform/assets/contants.dart';
import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  const RequestInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response!.statusCode == HttpStatus.unauthorized) {}

    return handler.reject(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = StorageRepository.getString(PlatformConstants.accessToken);
    options.headers.addAll({
      'Accept-Language':
          StorageRepository.getString('language', defValue: 'uz'),
      if (!options.headers.keys.contains('without_token'))
        if (token.isNotEmpty) HttpHeaders.authorizationHeader: 'Bearer $token',
    });

    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }
}
