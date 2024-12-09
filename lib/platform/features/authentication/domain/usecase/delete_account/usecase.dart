import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/core/usecase/usecase.dart';
import 'package:barokat/platform/features/authentication/domain/repository/auth.dart';

class DeleteAccountUseCase extends UseCase<void, String> {
  final AuthenticationRepository _authenticationRepository;

  DeleteAccountUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<Either<Failure, void>> call(params) async {
    return _authenticationRepository.deleteAccount(params);
  }
}
