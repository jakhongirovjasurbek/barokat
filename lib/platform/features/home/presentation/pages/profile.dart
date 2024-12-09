import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/core/ui_kit/scale/scale.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:barokat/platform/core/routes/route_names.dart';
import 'package:barokat/platform/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:barokat/platform/features/home/presentation/widgets/cards_view.dart';
import 'package:barokat/platform/features/home/presentation/widgets/limit_info.dart';
import 'package:barokat/platform/features/home/presentation/widgets/profile/profile_header.dart';
import 'package:barokat/platform/features/home/presentation/widgets/profile/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthenticationBloc>().state.user;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.w16),
          child: Text(
            AppLocalization.of(context).profile,
            style: AppTheme.textThemeSemiBold.textXl,
          ),
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
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.w12,
          vertical: ScreenSize.h12,
        ),
        children: [
          ProfileHeader(user: user),
          SizedBox(height: ScreenSize.h24),
          const LimitInfo(),
          SizedBox(height: ScreenSize.h24),
          const CardsView(),
          SizedBox(height: ScreenSize.h12),
          ProfileItem(
            onTap: () {},
            title: 'To’lovlar Tarixi',
            icon: PlatformIcons.clockInfo,
          ),
          SizedBox(height: ScreenSize.h8),
          ProfileItem(
            onTap: () {},
            title: 'Email',
            icon: PlatformIcons.email,
          ),
          SizedBox(height: ScreenSize.h24),
          Text(
            'Yordam',
            style: AppTheme.textThemeMedium.textBase.copyWith(
              color: AppTheme.colors.textSecondary,
            ),
          ),
          SizedBox(height: ScreenSize.h12),
          ProfileItem(
            onTap: () {},
            title: "Qo'llab-quvvatlash xizmatiga yozish",
            icon: PlatformIcons.review,
          ),
          SizedBox(height: ScreenSize.h8),
          ProfileItem(
            onTap: () {},
            title: 'FAQ',
            icon: PlatformIcons.questionMarkCircle,
          ),
          SizedBox(height: ScreenSize.h24),
          Text(
            'Akkaunt',
            style: AppTheme.textThemeMedium.textBase.copyWith(
              color: AppTheme.colors.textSecondary,
            ),
          ),
          SizedBox(height: ScreenSize.h12),
          ProfileItem(
            onTap: () {
              context.read<AuthenticationBloc>().add(LogoutRequested());
            },
            title: "Chiqish",
            icon: PlatformIcons.logout,
          ),
          SizedBox(height: ScreenSize.h8),
          ProfileItem(
            onTap: () {
              context.read<AuthenticationBloc>().add(DeleteAccountRequested());
            },
            title: 'Akkauntni o’chirish',
            icon: PlatformIcons.trash,
          ),
          SizedBox(height: ScreenSize.h58),
        ],
      ),
    );
  }
}
