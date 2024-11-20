import 'package:barokat/core/either/either.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/core/usecase/usecase.dart';
import 'package:barokat/platform/features/authentication/domain/repository/auth.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/otp/params/params.dart';

class SendPhoneUseCase extends UseCase<void, SendPhoneParams> {
  final AuthenticationRepository _authenticationRepository;

  SendPhoneUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return _authenticationRepository.sendPhoneNumber(phoneNumber: params.phone);
  }
}
