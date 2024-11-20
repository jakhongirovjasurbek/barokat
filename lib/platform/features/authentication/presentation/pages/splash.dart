import 'package:barokat/core/enums/authentication_status.dart';
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
  Widget build(BuildContext context) {
    print('Im here');
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        print('Im here 4 ${state.status}');
        if (state.status == AuthenticationStatus.authenticated) {
          Navigator.of(context).pushNamed('/platform');
        } else if (state.status == AuthenticationStatus.unauthenticated) {
          Navigator.of(context).pushNamed('/signup');
        }
      },
      builder: (context, state) {
        if (state.status == AuthenticationStatus.unknown) {
          print('Im here 2');
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
