import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
