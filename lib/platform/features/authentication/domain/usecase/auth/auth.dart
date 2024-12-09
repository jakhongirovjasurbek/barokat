import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/core/usecase/usecase.dart';
import 'package:barokat/platform/features/authentication/domain/enttiy/auth_user/user.dart';
import 'package:barokat/platform/features/authentication/domain/repository/auth.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/auth/params/params.dart';

class AuthenticateUseCase extends UseCase<AuthUserEntity, AuthParams> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticateUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<Either<Failure, AuthUserEntity>> call(params) async {
    return _authenticationRepository.authenticate(params);
  }
}
