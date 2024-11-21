import 'package:barokat/core/enums/authentication_status.dart';
import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    AppTheme.init();
    ScreenSize.setSizes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          Navigator.of(context).pushNamed('/platform');
        } else if (state.status == AuthenticationStatus.unauthenticated) {
          Navigator.of(context).pushNamed('/signup');
        }
      },
      builder: (context, state) {
        if (state.status == AuthenticationStatus.unknown) {
          context.read<AuthenticationBloc>().add(GetAuthenticationStatus());
        }
        return const Scaffold(
          body: Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      },
    );
  }
}
