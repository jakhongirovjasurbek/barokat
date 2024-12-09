import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/button/button.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:barokat/core/ui_kit/text_field/text_field.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:barokat/platform/core/routes/route_names.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
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
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.w16,
              vertical: ScreenSize.h16,
            ),
            children: [
              Text(
                AppLocalization.of(context).login,
                style: AppTheme.textThemeMedium.text2Xl,
              ),
              SizedBox(height: ScreenSize.h24),
              TextFormFieldX(
                controller: phoneController,
                label: AppLocalization.of(context).phone_number,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: '+### (##) ###-##-##',
                    filter: {"#": RegExp(r'[0-9]')},
                  )
                ],
                validator: (value) {
                  if (value == null) {
                    return AppLocalization.of(context).phone_not_empty;
                  }

                  final phoneNumber = value.replaceAll(RegExp(r'\D'), '');

                  if (phoneNumber.length != 12) {
                    return AppLocalization.of(context).phone_not_empty;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.w16,
                vertical: ScreenSize.h16,
              ),
              child: ButtonX(
                loading: state.status.isLoading,
                onTap: () => sendOtp(context),
                text: AppLocalization.of(context).send_code,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void sendOtp(BuildContext context) {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      context.read<LoginBloc>().add(
            LoginSignInSendCodeButtonTapped(
              phoneNumber:
                  '+${phoneController.text.replaceAll(RegExp(r'\D'), '')}',
              onSuccess: () {
                Navigator.of(context).pushNamed(
                  PlatformRouteNames.loginOtp,
                  arguments: context.read<LoginBloc>(),
                );
              },
            ),
          );
    }
  }
}
