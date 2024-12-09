import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

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
        title: Text(
          AppLocalization.of(context).notifications,
          style: AppTheme.textThemeMedium.textXl,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(PlatformIcons.empty),
            SizedBox(height: ScreenSize.h18),
            Text(
              AppLocalization.of(context).no_notifications,
              style: AppTheme.textThemeSemiBold.textXl,
            ),
          ],
        ),
      ),
    );
  }
}
