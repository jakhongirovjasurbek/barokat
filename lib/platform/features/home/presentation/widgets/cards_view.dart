import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardsView extends StatelessWidget {
  const CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Kartalar',
          style: AppTheme.textThemeMedium.textBase.copyWith(
            color: AppTheme.colors.textSecondary,
          ),
        ),
        SizedBox(height: ScreenSize.h10),
        SizedBox(
          height: 90.h,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (context, index) {
              return ScaleX(
                onTap: () {},
                child: Container(
                  width: 186.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ScreenSize.r12),
                    color: AppTheme.colors.textSecondary.withOpacity(.1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(PlatformIcons.addCircle),
                      SizedBox(height: ScreenSize.h8),
                      Text(
                        'Karta qo’shish',
                        style: AppTheme.textThemeMedium.textXs.copyWith(
                          color: AppTheme.colors.textBrand,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
