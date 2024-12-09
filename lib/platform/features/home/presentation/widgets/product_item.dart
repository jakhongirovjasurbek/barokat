import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final String route;

  const ProductItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleX(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: 120.w,
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.w12,
          vertical: ScreenSize.h12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ScreenSize.r16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              icon,
              width: ScreenSize.w32,
              height: ScreenSize.h32,
            ),
            Text(
              title,
              style: AppTheme.textThemeMedium.textXs,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
