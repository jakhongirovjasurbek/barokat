import 'dart:io';

import 'package:barokat/core/theme/colors/colors.dart';
import 'package:barokat/core/theme/colors/light_mode_colors.dart';
import 'package:barokat/core/theme/screen_size/screen_size.dart';
import 'package:barokat/core/theme/text_style/styles.dart';
import 'package:barokat/core/theme/text_style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  /// App theme colors
  static late PrimitiveColors colors;

  /// Current app theme mode
  static ThemeMode themeMode = ThemeMode.dark;

  static late AppTextStyles textThemeLight;
  static late AppTextStyles textThemeNormal;
  static late AppTextStyles textThemeMedium;
  static late AppTextStyles textThemeSemiBold;

  static Future<void> init() async {
    colors = _getThemeColors();

    // light
    textThemeLight = TextStyleX(
      text2Xs: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w200,
        fontSize: 10.sp,
      ),
      textXs: TextStyle(
        fontFamily: 'Poppins',
        letterSpacing: 0,
        color: colors.textPrimary,
        fontWeight: FontWeight.w200,
        fontSize: 12.sp,
      ),
      textSm: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w200,
        fontSize: 14.sp,
      ),
      textBase: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w200,
        fontSize: 16.sp,
      ),
      textLg: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w200,
        fontSize: 18.sp,
      ),
      textXl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w200,
        fontSize: 20.sp,
      ),
      text2Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w200,
        fontSize: 24.sp,
      ),
      text3Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w200,
        fontSize: 30.sp,
      ),
      text4Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w200,
        fontSize: 36.sp,
      ),
      text5Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w200,
        fontSize: 48.sp,
      ),
    );

    // normal
    textThemeNormal = TextStyleX(
      text2Xs: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 10.sp,
      ),
      textXs: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
      ),
      textSm: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      textBase: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
      textLg: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 18.sp,
      ),
      textXl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
      ),
      text2Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 24.sp,
      ),
      text3Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 30.sp,
      ),
      text4Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 36.sp,
      ),
      text5Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 48.sp,
      ),
    );

    // bold
    textThemeMedium = TextStyleX(
      text2Xs: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 10.sp,
      ),
      textXs: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
      ),
      textSm: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
      textBase: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
      textLg: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
      ),
      textXl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
      ),
      text2Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 24.sp,
      ),
      text3Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 30.sp,
      ),
      text4Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 36.sp,
      ),
      text5Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 48.sp,
      ),
    );

    // semi bold
    textThemeSemiBold = TextStyleX(
      text2Xs: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 10.sp,
      ),
      textXs: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
      ),
      textSm: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
      ),
      textBase: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
      textLg: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      textXl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
      text2Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 24.sp,
      ),
      text3Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 30.sp,
      ),
      text4Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 36.sp,
      ),
      text5Xl: TextStyle(
        letterSpacing: 0,
        fontFamily: 'Poppins',
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 48.sp,
      ),
    );
  }

  static ThemeData getTheme() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return ThemeData(
      useMaterial3: true,
      primaryColor: colors.surfaceBrand,
      scaffoldBackgroundColor: colors.surfacePrimary,
      fontFamily: 'Poppins',
      dividerColor: colors.surfacePrimary,
      disabledColor: colors.surfaceBrandDisabled,
      colorScheme: ColorScheme.light(
        primary: colors.surfaceBrand,
        surface: colors.surfacePrimary,
      ),
      dividerTheme: DividerThemeData(
        color: colors.bgPrimary,
        thickness: 1,
        space: 1,
      ),
      tabBarTheme: TabBarTheme(
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        labelStyle: textThemeMedium.textSm.copyWith(
          color: colors.textBrand,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenSize.r8),
          color: colors.textBrand.withOpacity(0.1),
        ),
        unselectedLabelStyle: textThemeMedium.textSm.copyWith(
          color: colors.textSecondary,
        ),
        dividerHeight: 0,
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: colors.surfaceBrand,
        centerTitle: true,
      ),
      snackBarTheme: SnackBarThemeData(
        elevation: 0,
        backgroundColor: colors.surfacePrimary,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      buttonTheme: ButtonThemeData(
        height: 48.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        colorScheme: ColorScheme.light(
          scrim: Colors.white,
          onSurface: colors.surfaceBrandLowered,
          surface: colors.surfaceBrand,
          secondary: colors.surfaceBrandDisabled,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: colors.textBrand),
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: colors.iconBrand,
        selectedBorderColor: colors.iconBrand,
        fillColor: colors.iconBrand,
      ),
      checkboxTheme: CheckboxThemeData(
        overlayColor: WidgetStatePropertyAll(
          colors.surfaceBrandLowered,
        ),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.isEmpty) {
            return colors.surfaceSecondary;
          }
          if (states.contains(WidgetState.selected)) {
            return colors.surfaceBrand;
          }
          return null;
        }),
        side: BorderSide(color: colors.borderSecondary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.surfacePrimary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colors.surfacePrimary,
        elevation: 0,
        selectedItemColor: colors.surfaceBrand,
        unselectedItemColor: colors.iconSecondary,
        selectedLabelStyle: textThemeNormal.textXs.copyWith(
          color: colors.textBrand,
        ),
        unselectedLabelStyle: textThemeNormal.textXs.copyWith(
          color: colors.iconSecondary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: colors.surfaceSecondary,
        focusColor: colors.borderPrimary,
        filled: true,
        errorMaxLines: 3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.surfaceSecondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.surfaceSecondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.surfaceSecondary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.borderError, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.borderError, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.surfaceSecondaryLowered),
        ),
        hintStyle: textThemeNormal.textBase.copyWith(
          color: colors.textSecondary,
        ),
      ),
    );
  }

  static ScrollPhysics appScrollPhysics() {
    if (Platform.isAndroid) {
      return const AlwaysScrollableScrollPhysics(
        parent: ClampingScrollPhysics(),
      );
    }

    return const AlwaysScrollableScrollPhysics(
      parent: BouncingScrollPhysics(),
    );
  }

  static PrimitiveColors _getThemeColors() => LightModeColors();
}
