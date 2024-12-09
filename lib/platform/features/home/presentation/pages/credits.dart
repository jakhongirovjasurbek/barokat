import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:barokat/platform/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 80.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.w16),
          child: SvgPicture.asset(PlatformIcons.logo),
        ),
        actions: [
          ScaleX(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 3),
                  backgroundColor: AppTheme.colors.surfaceErrorPale,
                  content: Text(
                    AppLocalization.of(context).notifications,
                    style: AppTheme.textThemeNormal.textBase,
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: ScreenSize.w16,
                right: ScreenSize.w12,
              ),
              child: SvgPicture.asset(PlatformIcons.chat),
            ),
          ),
          ScaleX(
            onTap: () => Navigator.of(context)
                .pushNamed(PlatformRouteNames.notifications),
            child: Padding(
              padding: EdgeInsets.only(
                left: ScreenSize.w12,
                right: ScreenSize.w16,
              ),
              child: SvgPicture.asset(PlatformIcons.bell),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(PlatformIcons.empty),
            SizedBox(height: ScreenSize.h18),
            Text(
              "To'lovlar mavjud emas!",
              style: AppTheme.textThemeSemiBold.textXl,
            ),
          ],
        ),
      ),
    );
  }
}
