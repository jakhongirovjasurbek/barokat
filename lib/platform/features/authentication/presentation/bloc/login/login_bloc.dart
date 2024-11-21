import 'package:barokat/core/enums/loading_status.dart';
import 'package:barokat/core/failure/failure.dart';
import 'package:barokat/platform/features/authentication/data/data_source/remote/auth.dart';
import 'package:barokat/platform/features/authentication/data/repository/authentication/authentication.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/confirm_phone/confirm_phone.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/confirm_phone/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/create_passcode/create_passcode.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/create_passcode/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/signup/params/params.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/signup/signup.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginPrivacyAgreementTapped>((event, emit) {
      final value = !state.agreeWithPrivacyPolicy;
      emit(state.copyWith(agreeWithPrivacyPolicy: value));
    });

    on<LoginSendCodeButtonTapped>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));

      final response = await SignupUseCase(
        authenticationRepository: AuthenticationRepositoryImpl(
          authenticationRemoteDataSource: AuthenticationRemoteDataSourceImpl(),
        ),
      ).call(SignupParams(
        fullName: event.fullName,
        phoneNumber: event.phoneNumber,
      ));

      response.either(
        (failure) {
          emit(state.copyWith(
            status: LoadingStatus.loadFailure,
            failure: failure,
          ));
        },
        (_) {
          print(('OTP: $_'));
          emit(state.copyWith(
            status: LoadingStatus.loadSuccess,
            phoneNumber: event.phoneNumber,
            fullName: event.fullName,
          ));
          event.onSuccess();
        },
      );
    });

    on<LoginOTPContinueButtonTapped>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));

      final response = await ConfirmPhoneUseCase(
        authenticationRepository: AuthenticationRepositoryImpl(
          authenticationRemoteDataSource: AuthenticationRemoteDataSourceImpl(),
        ),
      ).call(ConfirmPhoneParams(
        phone: state.phoneNumber,
        code: event.otp,
        isLogin: false,
      ));

      response.either(
        (failure) {
          emit(state.copyWith(
            status: LoadingStatus.loadFailure,
            failure: failure,
          ));
        },
        (_) {
          emit(state.copyWith(status: LoadingStatus.loadSuccess));
          event.onSuccess();
        },
      );
    });

    on<LoginCreatePasscodeEvent>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));

      final response = await CreatePasscodeUseCase(
        authenticationRepository: AuthenticationRepositoryImpl(
          authenticationRemoteDataSource: AuthenticationRemoteDataSourceImpl(),
        ),
      ).call(CreatePasscodeParams(
        passcode: event.passcode,
        phone: state.phoneNumber,
      ));

      response.either(
        (failure) {
          emit(state.copyWith(
            status: LoadingStatus.loadFailure,
            failure: failure,
          ));
        },
        (_) {
          emit(state.copyWith(status: LoadingStatus.loadSuccess));
          event.onSuccess();
        },
      );
    });
  }
}
