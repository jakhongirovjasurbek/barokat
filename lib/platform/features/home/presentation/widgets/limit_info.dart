import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LimitInfo extends StatelessWidget {
  const LimitInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleX(
      onTap: () {},
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenSize.r16),
          gradient: LinearGradient(
            colors: [
              AppTheme.colors.surfaceBrand,
              AppTheme.colors.surfaceBrand.withOpacity(.9),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.w16,
            vertical: ScreenSize.h16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Ilovadan maksimal darajada foydalaning',
                      style: AppTheme.textThemeSemiBold.textXs.copyWith(
                        color: AppTheme.colors.textOnBrand,
                      ),
                    ),
                  ),
                  SvgPicture.asset(PlatformIcons.chevronRight),
                ],
              ),
              SizedBox(height: ScreenSize.h2),
              Text(
                'Cheklovni olish uchun toʻliq tasdiqlang',
                style: AppTheme.textThemeNormal.textXs.copyWith(
                  color: AppTheme.colors.textOnBrand,
                ),
              ),
              SizedBox(height: ScreenSize.h16),
              Row(
                children: List.generate(
                  4,
                  (index) {
                    return Expanded(
                      child: Container(
                        width: 75.w,
                        height: ScreenSize.h6,
                        margin: EdgeInsets.only(right: ScreenSize.w4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            ScreenSize.r24,
                          ),
                          color: switch (index == 0) {
                            (true) => Colors.white,
                            (false) => Colors.white.withOpacity(.4),
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: ScreenSize.h6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  4,
                  (index) {
                    return Expanded(
                      child: Container(
                        width: 75.w,
                        margin: EdgeInsets.only(right: ScreenSize.w4),
                        child: Text(
                          getLimitText(index),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.textThemeMedium.text2Xs.copyWith(
                            color: switch (index == 0) {
                              (true) => AppTheme.colors.textOnBrand,
                              (false) =>
                                AppTheme.colors.textOnBrand.withOpacity(.6),
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getLimitText(int index) => switch (index) {
        (0) => 'Tekshirish',
        (1) => 'Karta',
        (2) => 'Email',
        (3) => 'Qayta ishlash chegarasi',
        _ => '',
      };
}
