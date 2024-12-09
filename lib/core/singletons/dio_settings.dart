import 'package:barokat/core/network/request_interceptor.dart';
import 'package:dio/dio.dart';

class DioSettings {
  final _dioBaseOptions = BaseOptions(
    baseUrl: 'http://164.92.117.144:3003/api/v1',
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    validateStatus: (status) => status != null && status <= 500,
  );

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  Dio get dio => Dio(_dioBaseOptions)
    ..interceptors.addAll([
      const RequestInterceptor(),
    ]);
}
