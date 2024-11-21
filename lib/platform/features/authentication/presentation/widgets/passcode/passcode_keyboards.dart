import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:barokat/platform/features/authentication/presentation/widgets/passcode/passcode_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasscodeKeyboards extends StatelessWidget {
  const PasscodeKeyboards({
    super.key,
    required this.onTap,
    required this.onBackspaceTap,
    this.helperKeyboard,
  });

  final ValueChanged<int> onTap;
  final Widget? helperKeyboard;
  final VoidCallback onBackspaceTap;

  @override
  Widget build(BuildContext context) {
    final keyboardSize = 0.2.sw;

    return Column(
      children: [
        SizedBox(
          width: 0.8.sw,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: ScreenSize.w12,
            children: List.generate(9, (index) {
              final data = '${index + 1}';
              return PasscodeKeyboard(
                onPressed: () {
                  onTap(index + 1);
                },
                size: keyboardSize,
                child: Text(
                  data,
                  style: AppTheme.textThemeNormal.text2Xl,
                ),
              );
            }),
          ),
        ),
        SizedBox(
          width: 0.8.sw,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (helperKeyboard != null)
                  helperKeyboard!
                else
                  SizedBox(width: keyboardSize + ScreenSize.w12),
                PasscodeKeyboard(
                  onPressed: () {
                    onTap(0);
                  },
                  size: keyboardSize,
                  child: Text(
                    '0',
                    style: AppTheme.textThemeNormal.text2Xl,
                  ),
                ),
                PasscodeKeyboard(
                  onPressed: onBackspaceTap,
                  size: keyboardSize,
                  child: SvgPicture.asset(
                    PlatformIcons.backspace,
                    color: AppTheme.colors.iconSecondary,
                    width: ScreenSize.h24,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
