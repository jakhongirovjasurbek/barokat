import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/core/usecase/usecase.dart';
import 'package:barokat/platform/features/authentication/domain/repository/auth.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/signup/params/params.dart';

class SignupUseCase extends UseCase<void, SignupParams> {
  final AuthenticationRepository _authenticationRepository;

  SignupUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return _authenticationRepository.signup(params);
  }
}
