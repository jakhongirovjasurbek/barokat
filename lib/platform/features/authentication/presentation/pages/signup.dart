import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/button/button.dart';
import 'package:barokat/core/ui_kit/checkbox/checkbox.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:barokat/core/ui_kit/text_field/text_field.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:barokat/platform/core/routes/route_names.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: Builder(
          builder: (context) {
            return BlocListener<LoginBloc, LoginState>(
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
              child: Scaffold(
                backgroundColor: AppTheme.colors.surfacePrimary,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: AppTheme.colors.surfacePrimary,
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
                        AppLocalization.of(context).signup,
                        style: AppTheme.textThemeMedium.text2Xl,
                      ),
                      SizedBox(height: ScreenSize.h10),
                      ScaleX(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            PlatformRouteNames.login,
                            arguments: context.read<LoginBloc>(),
                          );
                        },
                        child: Text(
                          AppLocalization.of(context).have_account,
                          style: AppTheme.textThemeNormal.textBase.copyWith(
                            color: AppTheme.colors.textBrand,
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenSize.h16),
                      TextFormFieldX(
                        controller: nameController,
                        label: AppLocalization.of(context).full_name,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null) {
                            return AppLocalization.of(context).name_not_empty;
                          }
                          if (value.isEmpty) {
                            return AppLocalization.of(context).name_not_empty;
                          }
                          if (value.length < 3) {
                            return AppLocalization.of(context).name_not_empty;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: ScreenSize.h12),
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

                          final phoneNumber =
                              value.replaceAll(RegExp(r'\D'), '');

                          if (phoneNumber.length != 12) {
                            return AppLocalization.of(context).phone_not_empty;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: ScreenSize.h20),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              CheckboxX(
                                value: state.agreeWithPrivacyPolicy,
                                activeColor: AppTheme.colors.textBrand,
                                onChanged: (value) {
                                  context
                                      .read<LoginBloc>()
                                      .add(const LoginPrivacyAgreementTapped());
                                },
                              ),
                              SizedBox(width: ScreenSize.w8),
                              Text(
                                AppLocalization.of(context).agree_privacy,
                                style: AppTheme.textThemeNormal.textBase,
                              )
                            ],
                          );
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
                        disabled: !state.agreeWithPrivacyPolicy,
                        loading: state.status.isLoading,
                        onTap: () => sendOtp(context),
                        text: AppLocalization.of(context).send_code,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void sendOtp(BuildContext context) {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      context.read<LoginBloc>().add(
            LoginSendCodeButtonTapped(
              phoneNumber:
                  '+${phoneController.text.replaceAll(RegExp(r'\D'), '')}',
              fullName: nameController.text,
              onSuccess: () {
                Navigator.of(context).pushNamed(
                  PlatformRouteNames.otp,
                  arguments: context.read<LoginBloc>(),
                );
              },
            ),
          );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
