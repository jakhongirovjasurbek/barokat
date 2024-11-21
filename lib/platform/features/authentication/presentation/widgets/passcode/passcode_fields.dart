import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/animation/bounce.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/animation/animation_preferences.dart';
import 'package:flutter_animator/widgets/attention_seekers/shake.dart';

class PasscodeField extends StatelessWidget {
  final bool isPasscodeIncorrect;
  final int filledInputCount;
  final bool isLoading;
  final String? error;

  const PasscodeField({
    super.key,
    required this.isPasscodeIncorrect,
    required this.filledInputCount,
    required this.isLoading,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 4; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            width: ScreenSize.r12,
            height: ScreenSize.r12,
            margin: EdgeInsets.symmetric(horizontal: ScreenSize.w12),
            decoration: BoxDecoration(
              color: isPasscodeIncorrect
                  ? AppTheme.colors.textError
                  : filledInputCount >= i
                      ? AppTheme.colors.textBrand
                      : AppTheme.colors.borderSecondary,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );

    if (isPasscodeIncorrect) {
      child = Shake(
        preferences: const AnimationPreferences(
          duration: Duration(milliseconds: 600),
        ),
        child: child,
      );
    } else if (isLoading) {
      child = Bounce(child: child);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        if (isPasscodeIncorrect) ...[
          SizedBox(height: ScreenSize.h4),
          Text(
            error == null
                ? AppLocalization.of(context).passcode_mismatch
                : error!,
            style: AppTheme.textThemeMedium.textBase.copyWith(
              color: AppTheme.colors.textError,
            ),
          ),
        ] else
          SizedBox(height: ScreenSize.h26)
      ],
    );
  }
}
