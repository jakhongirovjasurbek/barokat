import 'package:barokat/core/functions/fade.dart';
import 'package:barokat/platform/core/routes/route_names.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:barokat/platform/features/authentication/presentation/pages/confirm_passcode.dart';
import 'package:barokat/platform/features/authentication/presentation/pages/login.dart';
import 'package:barokat/platform/features/authentication/presentation/pages/login_one_time_password.dart';
import 'package:barokat/platform/features/authentication/presentation/pages/passcode.dart';
import 'package:barokat/platform/features/authentication/presentation/pages/signup.dart';
import 'package:barokat/platform/features/authentication/presentation/pages/signup_one_time_password.dart';
import 'package:barokat/platform/features/authentication/presentation/pages/splash.dart';
import 'package:barokat/platform/features/home/presentation/pages/main.dart';
import 'package:barokat/platform/features/notifications/presentation/pages/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class PlatformRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PlatformRouteNames.splash:
        return fade(page: const SplashPage(), name: settings.name!);

      case PlatformRouteNames.platform:
        return fade(page: const PlatformPage(), name: settings.name!);

      case PlatformRouteNames.signup:
        return fade(page: const SignupPage(), name: settings.name!);

      case PlatformRouteNames.otp:
        return fade(
          page: BlocProvider.value(
            value: settings.arguments as LoginBloc,
            child: const OneTimePasswordPage(),
          ),
          name: settings.name!,
        );

      case PlatformRouteNames.createPasscode:
        return fade(
          page: BlocProvider.value(
            value: settings.arguments as LoginBloc,
            child: const CreatePasscodePage(),
          ),
          name: settings.name!,
        );

      case PlatformRouteNames.login:
        return fade(
          page: BlocProvider.value(
            value: settings.arguments as LoginBloc,
            child: const LoginPage(),
          ),
          name: settings.name!,
        );

      case PlatformRouteNames.loginOtp:
        return fade(
          page: BlocProvider.value(
            value: settings.arguments as LoginBloc,
            child: const LoginOneTimePasswordPage(),
          ),
          name: settings.name!,
        );

      case PlatformRouteNames.checkPasscode:
        return fade(
          page: const CheckPasscodePage(),
          name: settings.name!,
        );

      case PlatformRouteNames.notifications:
        return fade(
          page: const NotificationsPage(),
          name: settings.name!,
        );

      default:
        return null;
    }
  }
}
