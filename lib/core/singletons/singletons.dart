library singletons;

import 'dart:async';

import 'package:barokat/core/authentication_info/authentication_info.dart';
import 'package:barokat/core/enums/authentication_status.dart';
import 'package:barokat/packages/shared_preferences/storage_repository.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  await StorageRepository.getInstance();

  serviceLocator.registerLazySingleton(() => AuthenticationInfoImpl(
        controller: StreamController<AuthenticationStatus>(),
      ));
}
