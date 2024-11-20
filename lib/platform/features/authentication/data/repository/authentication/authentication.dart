import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/exception/exception.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/platform/features/authentication/data/data_source/remote/auth.dart';
import 'package:barokat/platform/features/authentication/data/model/auth/user.dart';
import 'package:barokat/platform/features/authentication/domain/enttiy/auth_user/user.dart';
import 'package:barokat/platform/features/authentication/domain/repository/auth.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepositoryImpl({
    required this.authenticationRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, void>> confirmPhoneNumber({
    required String phoneNumber,
    required String code,
  }) async {
    try {
      final response = await authenticationRemoteDataSource.verifyPhoneNumber(
        phone: phoneNumber,
        code: code,
      );
      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }

  @override
  Future<Either<ServerFailure, void>> sendPhoneNumber({
    required String phoneNumber,
  }) async {
    try {
      final response = await authenticationRemoteDataSource.sendPhoneNumber(
        phone: phoneNumber,
      );
      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }

  @override
  Future<Either<ServerFailure, AuthUserEntity>> authenticate() async {
    try {
      print('My bad');
      final response = await authenticationRemoteDataSource.authenticate();

      final user = AuthUserModel.fromJson(response);


      print('passed difficulties');
      return Right(user);
    } on ServerException catch (error) {
      print('Not my bad: ${error.statusMessage}');
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }
}
