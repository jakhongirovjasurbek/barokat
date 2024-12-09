import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/core/usecase/usecase.dart';
import 'package:barokat/platform/features/authentication/domain/repository/auth.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/login/params/params.dart';

class LoginUseCase extends UseCase<void, LoginParams> {
  final AuthenticationRepository _authenticationRepository;

  LoginUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return _authenticationRepository.login(params);
  }
}
