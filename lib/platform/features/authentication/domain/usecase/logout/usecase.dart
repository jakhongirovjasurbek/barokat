import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/core/usecase/usecase.dart';
import 'package:barokat/platform/features/authentication/domain/repository/auth.dart';

class LogoutUseCase extends UseCase<void, NoParams> {
  final AuthenticationRepository _authenticationRepository;

  LogoutUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<Either<Failure, void>> call(params) async {
    return _authenticationRepository.logout();
  }
}
