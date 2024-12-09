import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:barokat/platform/core/routes/route_names.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:barokat/platform/features/authentication/presentation/widgets/passcode/passcode_fields.dart';
import 'package:barokat/platform/features/authentication/presentation/widgets/passcode/passcode_keyboards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckPasscodePage extends StatefulWidget {
  const CheckPasscodePage({super.key});

  @override
  State<CheckPasscodePage> createState() => _CheckPasscodePageState();
}

class _CheckPasscodePageState extends State<CheckPasscodePage> {
  String checkPasscode = '';
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.surfacePrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.colors.surfacePrimary,
      ),
      body: Column(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.colors.surfacePrimaryLowered,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              PlatformIcons.lock,
              color: AppTheme.colors.surfaceBrand,
            ),
          ),
          SizedBox(height: ScreenSize.h12),
          Text(
            AppLocalization.of(context).confirm_password,
            style: AppTheme.textThemeMedium.text2Xl,
          ),
          const Spacer(),
          PasscodeField(
            filledInputCount: checkPasscode.length - 1,
            isLoading: false,
            isPasscodeIncorrect: errorMessage != null,
            error: errorMessage,
          ),
          const Spacer(),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return PasscodeKeyboards(
                onTap: (int value) {
                  setState(() {
                    if (checkPasscode.length != 4) {
                      checkPasscode += '$value';
                    }
                  });

                  if (errorMessage != null && checkPasscode.length == 4) {
                    setState(() {
                      checkPasscode = '';
                      errorMessage = null;
                      return;
                    });
                  }

                  if (checkPasscode.length == 4) {
                    if (state.user.passcode == checkPasscode) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        PlatformRouteNames.platform,
                        (_) => false,
                      );
                    } else {
                      setState(() {
                        errorMessage =
                            AppLocalization.of(context).passcode_incorrect;
                      });
                    }
                  }
                },
                onBackspaceTap: () {
                  setState(() {
                    if (errorMessage != null) {
                      errorMessage = null;
                    }
                    final list = checkPasscode.split('');

                    if (list.isNotEmpty) {
                      checkPasscode = (list..removeLast()).join('');
                    }
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
