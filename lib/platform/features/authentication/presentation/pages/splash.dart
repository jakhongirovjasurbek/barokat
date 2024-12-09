import 'package:barokat/core/enums/authentication_status.dart';
import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:barokat/platform/core/routes/route_names.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        if (state.status.isAuthenticated) {
          Navigator.of(context).pushNamed(PlatformRouteNames.checkPasscode);
        } else if (state.status.isUnauthenticated) {
          Navigator.of(context).pushNamed(PlatformRouteNames.signup);
        }
      },
      builder: (context, state) {
        if (state.status == AuthenticationStatus.unknown) {
          context.read<AuthenticationBloc>().add(GetAuthenticationStatus());
        }
        return Scaffold(
          backgroundColor: AppTheme.colors.surfaceBrand,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'AGROS',
                style: AppTheme.textThemeSemiBold.text5Xl.copyWith(
                  color: AppTheme.colors.textOnBrand,
                ),
              ),
              SizedBox(height: 60.h),
              SvgPicture.asset(
                PlatformIcons.splash,
                width: 1.sw,
              ),
            ],
          ),
        );
      },
    );
  }
}
