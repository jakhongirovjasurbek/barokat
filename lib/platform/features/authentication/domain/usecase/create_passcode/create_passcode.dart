import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/core/usecase/usecase.dart';
import 'package:barokat/platform/features/authentication/domain/repository/auth.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/create_passcode/params/params.dart';

class CreatePasscodeUseCase extends UseCase<void, CreatePasscodeParams> {
  final AuthenticationRepository _authenticationRepository;

  CreatePasscodeUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return _authenticationRepository.createPasscode(params);
  }
}
