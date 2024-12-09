import 'package:barokat/platform/core/routes/route_names.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:barokat/platform/features/home/presentation/bloc/platform/platform_bloc.dart';
import 'package:barokat/platform/features/home/presentation/pages/credits.dart';
import 'package:barokat/platform/features/home/presentation/pages/home.dart';
import 'package:barokat/platform/features/home/presentation/pages/profile.dart';
import 'package:barokat/platform/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlatformPage extends StatelessWidget {
  const PlatformPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlatformBloc(),
      child: Builder(
        builder: (context) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state.status.isUnauthenticated) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  PlatformRouteNames.signup,
                  (_) => false,
                );
              }
            },
            child: Scaffold(
              body: BlocBuilder<PlatformBloc, PlatformState>(
                builder: (context, state) {
                  return IndexedStack(
                    index: state.selectedTab - 1,
                    children: const [
                      HomePage(),
                      CreditsPage(),
                      ProfilePage(),
                    ],
                  );
                },
              ),
              bottomNavigationBar: const BottomNavigationBarX(),
            ),
          );
        },
      ),
    );
  }
}
