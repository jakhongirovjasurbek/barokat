import 'dart:async';

import 'package:barokat/core/authentication_info/authentication_info.dart';
import 'package:barokat/core/enums/authentication_status.dart';
import 'package:barokat/core/singletons/singletons.dart';
import 'package:barokat/core/usecase/usecase.dart';
import 'package:barokat/packages/shared_preferences/storage_repository.dart';
import 'package:barokat/platform/features/authentication/data/data_source/remote/auth.dart';
import 'package:barokat/platform/features/authentication/data/repository/authentication/authentication.dart';
import 'package:barokat/platform/features/authentication/domain/enttiy/auth_user/user.dart';
import 'package:barokat/platform/features/authentication/domain/usecase/auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  /// A `StreamSubscription` used to listen to authentication status changes
  /// from the `AuthenticationInfoImpl` service.
  late StreamSubscription _streamSubscription;

  /// Initializes the `AuthenticationBloc` and sets up event handling.
  ///
  /// This constructor performs the following tasks:
  ///
  /// 1. Sets the initial state of the bloc to `AuthenticationState.unknown()`,
  ///    indicating that the authentication status is not yet determined.
  ///
  /// 2. Subscribes to the authentication status stream provided by
  ///    `AuthenticationInfoImpl`. Any status change emitted by this stream
  ///    triggers the addition of a `AuthenticationStatusChanged` event to the
  ///    bloc, ensuring that the authentication status is updated in response
  ///    to external changes.
  ///
  /// 3. Registers the event handlers for specific events:
  ///    - `GetAuthenticationStatus`: Manually triggers an update to the
  ///      authentication status by dispatching a `AuthenticationStatusChanged`
  ///      event with an `authenticated` status.
  ///
  /// ### Example Usage
  /// ```dart
  /// final authBloc = AuthenticationBloc();
  ///
  /// authBloc.add(GetAuthenticationStatus());
  /// ```
  AuthenticationBloc() : super(const AuthenticationState.unknown()) {
    _streamSubscription =
        serviceLocator<AuthenticationInfoImpl>().status.listen((event) {
      add(AuthenticationStatusChanged(status: event));
    });

    /// Handle `GetAuthenticationStatus` event.
    on<GetAuthenticationStatus>((event, emit) {
      print('Im here 3');
      add(const AuthenticationStatusChanged(
        status: AuthenticationStatus.authenticated,
      ));
    });

    on<AuthenticationStatusChanged>((event, emit) async {
      print('Im here 5');
      switch (event.status) {
        case AuthenticationStatus.unknown:
          emit(const AuthenticationState.unauthenticated());
          break;
        case AuthenticationStatus.authenticated:
          print('Hello world');
          final usecase = AuthenticateUseCase(
            authenticationRepository: AuthenticationRepositoryImpl(
              authenticationRemoteDataSource:
                  AuthenticationRemoteDataSourceImpl(),
            ),
          );

          print('Passed usecase');

          final response = await usecase.call(NoParams());

          print('Passed response $response');
          response.either((failure) {
            emit(const AuthenticationState.unauthenticated());
          }, (user) {
            emit(AuthenticationState.authenticated(
              user,
              dontRebuild: false,
            ));
          });
          break;
        case AuthenticationStatus.unauthenticated:
          emit(const AuthenticationState.unauthenticated());
          break;
        case AuthenticationStatus.redirected:
          emit(const AuthenticationState.unauthenticated());
          break;
      }
    });

    /// Handles the `LogoutRequested` event in the `AuthenticationBloc`.
    ///
    /// This event is triggered when a user requests to log out of the application.
    /// The handler performs the following actions:
    ///
    /// 1. Clears stored authentication-related data:
    ///    - `accessToken`: The access token used for API authentication.
    ///    - `refreshToken`: The token used to refresh expired access tokens.
    ///    - `passcode`: A locally stored passcode (if used in the application).
    ///
    /// 2. Emits an unauthenticated state to update the application's authentication
    ///    state, ensuring the user is logged out.
    ///
    /// Example:
    /// ```dart
    /// authenticationBloc.add(LogoutRequested());
    /// ```
    ///
    /// The `StorageRepository` is assumed to be a utility for managing persistent
    /// storage, and the `AuthenticationState.unauthenticated()` is a state that
    /// indicates the user is logged out and needs to re-authenticate.
    on<LogoutRequested>((event, emit) async {
      await StorageRepository.putString("accessToken", '');

      await StorageRepository.putString("refreshToken", '');

      await StorageRepository.putString("passcode", '');

      emit(const AuthenticationState.unauthenticated());
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
