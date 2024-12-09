import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/theme.dart';
import 'package:barokat/generated/l10n.dart';
import 'package:barokat/platform/assets/icons.dart';
import 'package:barokat/platform/features/home/presentation/bloc/platform/platform_bloc.dart';
import 'package:barokat/platform/features/home/presentation/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarX extends StatelessWidget {
  const BottomNavigationBarX({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatformBloc, PlatformState>(
      builder: (context, state) {
        return Container(
          height: ScreenSize.h58,
          decoration: BoxDecoration(
            color: AppTheme.colors.surfacePrimary,
            border: Border(
              top: BorderSide(
                width: 1,
                color: AppTheme.colors.borderSecondary,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: BottomNavItem(
                  onTap: () {
                    context
                        .read<PlatformBloc>()
                        .add(const PlatformTabSelected(1));
                  },
                  title: AppLocalization.of(context).main,
                  icon: PlatformIcons.home,
                  id: 1,
                  groupValue: state.selectedTab,
                ),
              ),
              Expanded(
                child: BottomNavItem(
                  onTap: () {
                    context
                        .read<PlatformBloc>()
                        .add(const PlatformTabSelected(2));
                  },
                  title: AppLocalization.of(context).payment,
                  icon: PlatformIcons.clock,
                  id: 2,
                  groupValue: state.selectedTab,
                ),
              ),
              Expanded(
                child: BottomNavItem(
                  onTap: () {
                    context
                        .read<PlatformBloc>()
                        .add(const PlatformTabSelected(3));
                  },
                  title: AppLocalization.of(context).profile,
                  icon: PlatformIcons.user,
                  id: 3,
                  groupValue: state.selectedTab,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
