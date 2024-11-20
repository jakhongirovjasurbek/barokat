import 'package:barokat/core/functions/fade.dart';
import 'package:barokat/platform/features/authentication/presentation/pages/signup.dart';
import 'package:barokat/platform/features/authentication/presentation/pages/splash.dart';
import 'package:barokat/platform/features/home/presentation/main.dart';
import 'package:flutter/material.dart';

abstract final class PlatformRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return fade(page: const SplashPage(), name: settings.name!);

      case '/platform':
        return fade(page: const PlatformPage(), name: settings.name!);

      case '/signup':
        return fade(page: const SignupPage(), name: settings.name!);

      default:
        return null;
    }
  }
}
