import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavItem extends StatelessWidget {
  final String icon;
  final int id;
  final int groupValue;
  final String title;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.id,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = id == groupValue;
    return ScaleX(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: ScreenSize.w24,
            height: ScreenSize.h24,
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                switch (isActive) {
                  (true) => AppTheme.colors.iconBrand,
                  (false) => AppTheme.colors.iconSecondary,
                },
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(height: ScreenSize.h2),
          Text(
            title,
            style: AppTheme.textThemeNormal.textXs.copyWith(
              color: switch (isActive) {
                (true) => AppTheme.colors.textBrand,
                (false) => AppTheme.colors.textSecondary,
              },
            ),
          )
        ],
      ),
    );
  }
}
