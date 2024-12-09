import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/platform/features/authentication/domain/enttiy/auth_user/user.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/auth/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/confirm_phone/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/create_passcode/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/login/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/signup/params/params.dart';

abstract class AuthenticationRepository {
  Future<Either<ServerFailure, void>> confirmPhoneNumber(
    ConfirmPhoneParams params,
  );

  Future<Either<ServerFailure, void>> signup(SignupParams params);

  Future<Either<ServerFailure, AuthUserEntity>> authenticate(AuthParams params);

  Future<Either<ServerFailure, void>> login(LoginParams params);

  Future<Either<ServerFailure, void>> createPasscode(
    CreatePasscodeParams params,
  );

  Future<Either<ServerFailure, void>> logout();

  Future<Either<ServerFailure, void>> deleteAccount(String userId);
}
