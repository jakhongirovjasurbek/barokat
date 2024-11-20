import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/platform/features/authentication/domain/enttiy/auth_user/user.dart';

abstract class AuthenticationRepository {
  Future<Either<ServerFailure, void>> sendPhoneNumber({
    required String phoneNumber,
  });

  Future<Either<ServerFailure, void>> confirmPhoneNumber({
    required String phoneNumber,
    required String code,
  });

  Future<Either<ServerFailure, AuthUserEntity>> authenticate();
}
