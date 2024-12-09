import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/exception/exception.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/packages/shared_preferences/storage_repository.dart';
import 'package:barokat/platform/assets/contants.dart';
import 'package:barokat/platform/features/authentication/data/data_source/remote/auth.dart';
import 'package:barokat/platform/features/authentication/data/model/auth/user.dart';
import 'package:barokat/platform/features/authentication/domain/enttiy/auth_user/user.dart';
import 'package:barokat/platform/features/authentication/domain/repository/auth.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/auth/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/confirm_phone/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/create_passcode/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/login/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/signup/params/params.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepositoryImpl({
    required this.authenticationRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, AuthUserEntity>> authenticate(
    AuthParams params,
  ) async {
    try {
      final response = await authenticationRemoteDataSource.authenticate(
        params,
      );
      final user = AuthUserModel.fromJson(response['data']);
      return Right(user);
    } on ServerException catch (error) {
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }

  @override
  Future<Either<ServerFailure, void>> signup(SignupParams params) async {
    try {
      final response = await authenticationRemoteDataSource.signup(params);

      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }

  @override
  Future<Either<ServerFailure, void>> confirmPhoneNumber(
    ConfirmPhoneParams params,
  ) async {
    try {
      final response = await authenticationRemoteDataSource.verifyPhoneNumber(
        params,
      );
      if (params.isLogin) {
        await StorageRepository.putString(
          PlatformConstants.accessToken,
          response['data']['access_token'],
        );
        await StorageRepository.putString(
          'refresh_token',
          response['data']['refresh_token'],
        );
      }

      return Right(response);
    } on ServerException catch (error, stacktrace) {
      print('Stacktrace: $stacktrace');
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }

  @override
  Future<Either<ServerFailure, void>> createPasscode(
    CreatePasscodeParams params,
  ) async {
    try {
      final response = await authenticationRemoteDataSource.createPasscode(
        params,
      );

      await StorageRepository.putString(
        PlatformConstants.accessToken,
        response['data']['access_token'],
      );
      await StorageRepository.putString(
        'refresh_token',
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
  Future<Either<ServerFailure, void>> login(LoginParams params) async {
    try {
      final _ = await authenticationRemoteDataSource.login(params);

      return Right(_);
    } on ServerException catch (error) {
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }

  @override
  Future<Either<ServerFailure, void>> deleteAccount(String userId) async {
    try {
      final _ = await authenticationRemoteDataSource.deleteAccount(userId);

      return Right(_);
    } on ServerException catch (error) {
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }

  @override
  Future<Either<ServerFailure, void>> logout() async {
    try {
      final _ = await authenticationRemoteDataSource.logout();

      return Right(_);
    } on ServerException catch (error) {
      return Left(ServerFailure(
        errorMessage: error.statusMessage,
        statusCode: error.statusCode,
      ));
    }
  }
}
