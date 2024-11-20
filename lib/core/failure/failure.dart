import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;
  final num statusCode;
  const Failure({
    required this.errorMessage,
    required this.statusCode,
  });
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({super.errorMessage = '', super.statusCode = 0});

  @override
  List<Object> get props => [errorMessage, statusCode];
}

class CacheFailure extends Failure {
  const CacheFailure({super.errorMessage = '', super.statusCode = 0});
}