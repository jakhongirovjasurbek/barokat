import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:barokat/platform/core/routes/route_names.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:barokat/platform/features/authentication/presentation/widgets/passcode/passcode_fields.dart';
import 'package:barokat/platform/features/authentication/presentation/widgets/passcode/passcode_keyboards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreatePasscodePage extends StatefulWidget {
  const CreatePasscodePage({super.key});

  @override
  State<CreatePasscodePage> createState() => _CreatePasscodePageState();
}

class _CreatePasscodePageState extends State<CreatePasscodePage> {
  String createdPasscode = '';
  String confirmPasscode = '';

  bool isConfirmingPasscode = false;
  bool isPasscodeIncorrect = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.status.isAuthenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            PlatformRouteNames.platform,
            (_) => false,
          );
        }
      },
      child: Scaffold(
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
              isConfirmingPasscode
                  ? AppLocalization.of(context).confirm_password
                  : AppLocalization.of(context).create_passcode,
              style: AppTheme.textThemeMedium.text2Xl,
            ),
            const Spacer(),
            PasscodeField(
              filledInputCount: switch (isConfirmingPasscode) {
                (true) => confirmPasscode.length - 1,
                (false) => createdPasscode.length - 1,
              },
              isLoading: false,
              isPasscodeIncorrect: isPasscodeIncorrect,
            ),
            const Spacer(),
            PasscodeKeyboards(
              onTap: (int value) {
                if (isConfirmingPasscode) {
                  setState(() {
                    if (isPasscodeIncorrect) {
                      isPasscodeIncorrect = false;
                    }
                    confirmPasscode += '$value';
                  });
                  if (confirmPasscode.length == 4 &&
                      createdPasscode == confirmPasscode) {
                    context.read<LoginBloc>().add(
                          LoginCreatePasscodeEvent(
                            passcode: createdPasscode,
                            onSuccess: () {
                              context.read<AuthenticationBloc>().add(
                                    GetAuthenticationStatus(),
                                  );
                            },
                          ),
                        );
                  } else {
                    if (confirmPasscode.length == 4) {
                      setState(() {
                        confirmPasscode = '';
                        isPasscodeIncorrect = true;
                      });
                    }
                  }
                } else {
                  setState(() {
                    createdPasscode += '$value';
                  });

                  if (createdPasscode.length == 4) {
                    setState(() {
                      isConfirmingPasscode = true;
                    });
                  }
                }
              },
              onBackspaceTap: () {
                if (isConfirmingPasscode) {
                  setState(() {
                    final list = confirmPasscode.split('');
                    confirmPasscode = (list..removeLast()).join('');
                  });
                } else {
                  setState(() {
                    final list = createdPasscode.split('');
                    createdPasscode = (list..removeLast()).join('');
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
