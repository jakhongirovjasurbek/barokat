// Flutter imports:
import 'package:flutter/material.dart';

abstract base class PrimitiveColors {
  Color get dayPrimary => const Color(0xFF00AF66);

  final Color _carwash = const Color(0xFFF9C304);
  Color get carwashBg => _carwash;

  final Color _alif = const Color(0xFF00A3FF);
  Color get textBrand => _alif;
  Color get iconBrand => _alif;
  Color get borderBrand => _alif;

  final Color _alifIndended = const Color(0xff5594F2);
  Color get surfaceBrandIndended => _alifIndended;

  Color get surfaceBrand => _alif;
  Color get surfaceBrandLowered => const Color(0xff008AD7);
  Color get surfaceBrandDisabled => const Color(0xffD4DDE4);

  final Color _success = const Color(0xFF00AF66);
  Color get success => _success;

  final Color _alifPale = const Color.fromRGBO(235, 254, 243, 1);
  Color get alifPale => _alifPale;

  final Color _warning = const Color(0xFFFFB444);
  Color get warning => _warning;

  final Color _error = const Color(0xFFFF4444);
  Color get error => _error;

  Color get textError => _error;
  Color get iconError => _error;
  Color get borderError => _error;

  // carousel gradient
  final Color _offersGradientBlue = const Color(0xFF03527E);
  Color get offersGradientBlue => _offersGradientBlue;
  final Color _offersGradientDark = const Color(0xFF191A1C);
  Color get offersGradientDark => _offersGradientDark;

  final Color waiting = const Color(0xFFF8A03A);

  final Color goldColor = const Color(0xFFFFB800);
  final Color bluePrimary = const Color(0xFF00A3FF);

  // order star
  final Color yellow = const Color(0xFFFFD200);
  final Color orangePrimary = const Color(0xFFFFB444);
  final Color orangeSecondary = const Color(0xFFFFB444).withOpacity(0.1);
  final Color orangeBackground = const Color(0xFFFFB444).withOpacity(0.1);

  //background
  Color get backgroundInfo => const Color(0xFFCCEDFF);
  Color get backgroundSuccess => const Color(0xFFCCEFE0);
  Color get backgroundWarning => const Color(0xFFFFF2DA);
  Color get backgroundError => const Color(0xFFFFDADA);
  Color get backgroundNeutral => const Color(0xFFEDEFF1);

  ///text
  Color get textPrimary;
  Color get textSecondary;
  Color get textOnBrand;
  Color get textDisabled;
  Color get textSuccess;

  ///background
  Color get bgPrimary;
  Color get bgSecondary;

  ///surface
  Color get surfacePrimary;
  Color get surfacePrimaryLowered;
  Color get surfaceSecondary;
  Color get surfaceSecondaryLowered;
  Color get surfaceSuccess;
  Color get surfaceWarning;
  Color get surfaceBrandPale;
  Color get surfaceSuccessPale;
  Color get surfaceErrorPale;
  Color get surfaceWarningPale;

  ///border
  Color get borderPrimary;
  Color get borderSecondary;
  Color get borderSuccess;

  ///icon
  Color get iconPrimary;
  Color get iconSecondary;
  Color get iconOnBrand;
}
