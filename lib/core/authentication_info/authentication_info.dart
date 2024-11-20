import 'dart:async';

import 'package:barokat/core/enums/authentication_status.dart';

abstract class AuthenticationInfo {
  Stream<AuthenticationStatus> get status;

  AuthenticationInfo();
}

class AuthenticationInfoImpl extends AuthenticationInfo {
  AuthenticationInfoImpl({
    required StreamController<AuthenticationStatus> controller,
  }) : _controller = controller;

  final StreamController<AuthenticationStatus> _controller;

  @override
  Stream<AuthenticationStatus> get status async* {
    // await StorageRepository.getInstance();
    await Future.delayed(const Duration(milliseconds: 1500));
    yield AuthenticationStatus.authenticated;
    yield* _controller.stream;
  }
}
