import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/core/usecase/usecase.dart';
import 'package:barokat/platform/features/authentication/domain/repository/auth.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/confirm_phone/params/params.dart';

class ConfirmPhoneUseCase extends UseCase<void, ConfirmPhoneParams> {
  final AuthenticationRepository _authenticationRepository;

  ConfirmPhoneUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return _authenticationRepository.confirmPhoneNumber(
      phoneNumber: params.phone,
      code: params.code,
    );
  }
}
