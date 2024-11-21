import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/exception/exception.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/packages/shared_preferences/storage_repository.dart';
import 'package:barokat/platform/features/authentication/data/data_source/remote/auth.dart';
import 'package:barokat/platform/features/authentication/data/model/auth/user.dart';
import 'package:barokat/platform/features/authentication/domain/enttiy/auth_user/user.dart';
import 'package:barokat/platform/features/authentication/domain/repository/auth.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/confirm_phone/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/create_passcode/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/signup/params/params.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepositoryImpl({
    required this.authenticationRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, void>> confirmPhoneNumber(
    ConfirmPhoneParams params,
  ) async {
    try {
      final response = await authenticationRemoteDataSource.verifyPhoneNumber(
        params,
      );

      print('Response: $response');
      await StorageRepository.putString(
        'accessToken',
        response['data']['access_token'],
      );
      await StorageRepository.putString(
        'refreshToken',
        response['data']['refresh_token'],
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
      print('Auth in process');
      final response = await authenticationRemoteDataSource.authenticate();

      print('Auth finished with success: $response');

      final user = AuthUserModel.fromJson(response);
      return Right(user);
    } on ServerException catch (error) {
      print('Auth failed: ${error.statusMessage}');
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }

  @override
  Future<Either<ServerFailure, int>> signup(SignupParams params) async {
    try {
      final response = await authenticationRemoteDataSource.signup(params);

      return Right(response['data']);
    } on ServerException catch (error) {
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }

  @override
  Future<Either<ServerFailure, AuthUserEntity>> createPasscode(
    CreatePasscodeParams params,
  ) async {
    try {
      final response = await authenticationRemoteDataSource.createPasscode(
        params,
      );
      print('Auth finished with success: $response');

      final user = AuthUserModel.fromJson(response);
      await StorageRepository.putString('passcode', user.passcode);
      return Right(user);
    } on ServerException catch (error) {
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }
}
