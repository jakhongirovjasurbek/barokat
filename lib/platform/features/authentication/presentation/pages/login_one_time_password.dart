import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/button/button.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:barokat/platform/core/routes/route_names.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pinput/pinput.dart';

class LoginOneTimePasswordPage extends StatefulWidget {
  const LoginOneTimePasswordPage({super.key});

  @override
  State<LoginOneTimePasswordPage> createState() =>
      _LoginOneTimePasswordPageState();
}

class _LoginOneTimePasswordPageState extends State<LoginOneTimePasswordPage> {
  final pinPutController = TextEditingController();
  bool shouldEnableButton = false;

  @override
  void initState() {
    pinPutController.addListener(() {
      if (pinPutController.length == 6) {
        setState(() {
          shouldEnableButton = true;
        });
      } else if (shouldEnableButton) {
        setState(() {
          shouldEnableButton = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: MultiBlocListener(
        listeners: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.status.hasError) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 3),
                    backgroundColor: AppTheme.colors.surfaceErrorPale,
                    content: Text(
                      '${state.failure?.errorMessage}',
                      style: AppTheme.textThemeNormal.textBase,
                    ),
                  ),
                );
              }
            },
          ),
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state.status.isAuthenticated) {
                Navigator.of(context).pushNamed(
                  PlatformRouteNames.checkPasscode,
                  arguments: context.read<LoginBloc>(),
                );
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: AppTheme.colors.surfacePrimary,
          appBar: AppBar(
            backgroundColor: AppTheme.colors.surfacePrimary,
            leading: ScaleX(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: ScreenSize.h12,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: ScreenSize.w24,
                    maxHeight: ScreenSize.h24,
                  ),
                  child: SvgPicture.asset(PlatformIcons.chevronLeft),
                ),
              ),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.w16,
              vertical: ScreenSize.h16,
            ),
            children: [
              Text(
                AppLocalization.of(context).check_message,
                style: AppTheme.textThemeMedium.text2Xl,
              ),
              SizedBox(height: ScreenSize.h2),
              Text(
                AppLocalization.of(context).activation_code_sent,
                style: AppTheme.textThemeNormal.textBase,
              ),
              SizedBox(height: ScreenSize.h2),
              Text(
                context.read<LoginBloc>().state.phoneNumber,
                style: AppTheme.textThemeNormal.textBase,
              ),
              SizedBox(height: ScreenSize.h10),
              ScaleX(
                onTap: () => Navigator.of(context).pop(),
                child: Text(
                  AppLocalization.of(context).wrong_number,
                  style: AppTheme.textThemeNormal.textBase.copyWith(
                    color: AppTheme.colors.textBrand,
                  ),
                ),
              ),
              SizedBox(height: ScreenSize.h26),
              Pinput(
                length: 6,
                controller: pinPutController,
                defaultPinTheme: PinTheme(
                  width: ScreenSize.w48,
                  height: 56.h,
                  textStyle: AppTheme.textThemeNormal.textXl,
                  decoration: BoxDecoration(
                    color: AppTheme.colors.surfaceSecondary,
                    borderRadius: BorderRadius.circular(
                      ScreenSize.r8,
                    ),
                  ),
                ),
                errorPinTheme: PinTheme(
                  width: ScreenSize.w48,
                  height: 56.h,
                  textStyle: AppTheme.textThemeNormal.textXl,
                  decoration: BoxDecoration(
                    color: AppTheme.colors.surfaceSecondary,
                    borderRadius: BorderRadius.circular(
                      ScreenSize.r8,
                    ),
                    border: Border.all(
                      width: 1.w,
                      color: AppTheme.colors.error,
                    ),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: ScreenSize.w48,
                  height: 56.h,
                  textStyle: AppTheme.textThemeNormal.textXl,
                  decoration: BoxDecoration(
                    color: AppTheme.colors.surfaceSecondary,
                    borderRadius: BorderRadius.circular(
                      ScreenSize.r8,
                    ),
                    border: Border.all(
                      width: 1.w,
                      color: AppTheme.colors.borderBrand,
                    ),
                  ),
                ),
                onCompleted: (_) {},
                onSubmitted: (_) {},
              )
            ],
          ),
          bottomNavigationBar: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) => ButtonX(
              disabled: !shouldEnableButton,
              loading: state.status.isLoading,
              margin: EdgeInsets.symmetric(
                horizontal: ScreenSize.w16,
                vertical: ScreenSize.h16,
              ),
              onTap: () => context.read<LoginBloc>().add(
                    LoginSignInOTPContinueButtonTapped(
                      otp: pinPutController.text,
                      onSuccess: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(GetAuthenticationStatus());
                      },
                    ),
                  ),
              text: AppLocalization.of(context).continue_,
            ),
          ),
        ),
      ),
    );
  }
}
