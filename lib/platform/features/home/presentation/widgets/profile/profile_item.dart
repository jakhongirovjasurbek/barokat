import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const ProfileItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleX(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenSize.r12),
          color: AppTheme.colors.textSecondary.withOpacity(.1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.w16,
            vertical: ScreenSize.h12,
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon),
              SizedBox(width: ScreenSize.w12),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.textThemeMedium.textSm,
                ),
              ),
              SvgPicture.asset(
                PlatformIcons.chevronRight,
                colorFilter: ColorFilter.mode(
                  AppTheme.colors.iconBrand,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
