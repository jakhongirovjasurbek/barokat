import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:barokat/platform/core/routes/route_names.dart';
import 'package:barokat/platform/features/home/presentation/widgets/limit_info.dart';
import 'package:barokat/platform/features/home/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFDAE2E2),
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
      body: ListView(
        children: [
          const PlatformProducts(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.w12,
              vertical: ScreenSize.h24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Parrandachilik',
                  style: AppTheme.textThemeMedium.textBase,
                ),
                SizedBox(height: ScreenSize.h12),
                AnimalCardWidget(),
                SizedBox(height: ScreenSize.h14),
                Text(
                  'Punktlarimiz',
                  style: AppTheme.textThemeMedium.textBase,
                ),
                SizedBox(height: ScreenSize.h12),
                ScaleX(
                  onTap: () {},
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppTheme.colors.surfaceBrand.withOpacity(.15),
                      borderRadius: BorderRadius.circular(ScreenSize.r12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenSize.w14, vertical: ScreenSize.h14),
                      child: Row(
                        children: [
                          SvgPicture.asset(PlatformIcons.puncts),
                          SizedBox(width: ScreenSize.w12),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Bizning topshirish punktlarimizni joylashuvi',
                                  style:
                                      AppTheme.textThemeMedium.textXs.copyWith(
                                    color: AppTheme.colors.textSecondary,
                                  ),
                                ),
                                SizedBox(height: ScreenSize.h8),
                                Row(
                                  children: [
                                    Text(
                                      'Kartaga o’tish',
                                      style: AppTheme.textThemeMedium.textXs,
                                    ),
                                    SizedBox(width: ScreenSize.w4),
                                    SvgPicture.asset(
                                      PlatformIcons.chevronRight,
                                      height: ScreenSize.h8,
                                      colorFilter: ColorFilter.mode(
                                        AppTheme.colors.iconBrand,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlatformProducts extends StatelessWidget {
  const PlatformProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: const Color(0xFFDAE2E2),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(ScreenSize.r16),
            bottomRight: Radius.circular(ScreenSize.r16),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.w12,
          vertical: ScreenSize.h12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProductItem(
                    onTap: () {},
                    icon: PlatformIcons.parrandachilik,
                    title: 'Parrandachilik',
                    route: '',
                  ),
                  SizedBox(width: ScreenSize.w16),
                  ProductItem(
                    onTap: () {},
                    icon: PlatformIcons.chorvachilik,
                    title: 'Chorvachilik',
                    route: '',
                  ),
                  SizedBox(width: ScreenSize.w16),
                  ProductItem(
                    onTap: () {},
                    icon: PlatformIcons.uskunalar,
                    title: 'Uskunalar',
                    route: '',
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenSize.h16),
            const LimitInfo(),
            SizedBox(height: ScreenSize.h4),
          ],
        ),
      ),
    );
  }
}

class AnimalCardWidget extends StatelessWidget {
  const AnimalCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EEF0), // Light grey background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Tovuq, Jo’ja,\n'
                  'Xo’rozlarni oson yo’l\n'
                  'bilan sotib oling!',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: AppTheme.textThemeMedium.textBase,
                ),
                SizedBox(height: ScreenSize.h8),
                Text(
                  '6 ta yo’l bilan to’lov qilish mavjud!',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppTheme.textThemeNormal.textXs.copyWith(
                    color: AppTheme.colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                ScaleX(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'Barchasi',
                        style: AppTheme.textThemeMedium.textSm.copyWith(
                          color: AppTheme.colors.textBrand,
                        ),
                      ),
                      SizedBox(width: ScreenSize.w8),
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
              ],
            ),
          ),
          SizedBox(width: ScreenSize.w12),
          Container(
            width: 100,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://api.cabinet.smart-market.uz/uploads/images/ff808181129086bad4659712',
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tovuq',
                  style: AppTheme.textThemeMedium.textBase,
                ),
                SizedBox(height: ScreenSize.h6),
                CustomOutlinedButton(
                  text: 'Batafsil',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleX(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: ScreenSize.h4),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.colors.borderBrand,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(ScreenSize.r6), // Rounded corners
        ),
        child: Center(
          child: Text(
            text,
            style: AppTheme.textThemeNormal.text2Xs.copyWith(
              color: AppTheme.colors.textBrand,
            ),
          ),
        ),
      ),
    );
  }
}
