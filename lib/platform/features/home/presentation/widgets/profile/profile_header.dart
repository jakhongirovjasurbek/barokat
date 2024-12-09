import 'package:barokat/core/functions/format_phone.dart';
import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/cached_image/cached_image.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:barokat/platform/assets/images.dart';
import 'package:barokat/platform/features/authentication/domain/enttiy/auth_user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
  });

  final AuthUserEntity user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: switch (user.image != null) {
            (true) => CachedImage(
                imageUrl: user.image!,
                width: 48.w,
                height: 48.h,
                fit: BoxFit.cover,
              ),
            (false) => Image.asset(
                PlatformImages.noAvatar,
                width: 48.w,
                height: 48.h,
                fit: BoxFit.contain,
              ),
          },
        ),
        SizedBox(width: ScreenSize.w12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user.fullName,
                style: AppTheme.textThemeSemiBold.textBase,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: ScreenSize.h4),
              Text(
                formatPhoneNumber(user.phoneNumber),
                style: AppTheme.textThemeNormal.textSm.copyWith(
                  color: AppTheme.colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        ScaleX(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.h12,
              vertical: ScreenSize.h12,
            ),
            child: SvgPicture.asset(
              PlatformIcons.edit,
              width: ScreenSize.w20,
              height: ScreenSize.h20,
            ),
          ),
        ),
      ],
    );
  }
}
