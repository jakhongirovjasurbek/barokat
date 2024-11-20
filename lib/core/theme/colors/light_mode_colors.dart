// Flutter imports:
import 'package:barokat/core/theme/colors/colors.dart';
import 'package:flutter/material.dart';

final class LightModeColors extends PrimitiveColors {
  final Color _white100 = const Color(0xFFFFFFFF);
  final Color _orange30 = const Color(0xFFFFBF44);
  final Color _green100 = const Color(0xFF00AF66);

  @override
  Color get bgSecondary => _white100;

  @override
  Color get iconOnBrand => _white100;

  @override
  Color get surfacePrimary => _white100;

  @override
  Color get textOnBrand => _white100;

  final Color _grey50 = const Color(0xFFF7F8F9);

  @override
  Color get surfaceSecondary => _grey50;

  final Color _grey75 = const Color(0xFFF2F4F5);

  @override
  Color get bgPrimary => _grey75;

  final Color _grey100 = const Color(0xFFEDEFF1);

  @override
  Color get borderSecondary => _grey100;

  final Color _grey200 = const Color(0xFFD7DCE0);

  @override
  Color get borderPrimary => _grey200;

  final Color _grey300 = const Color(0xFFB3BEC6);

  @override
  Color get iconSecondary => _grey300;

  @override
  Color get textSecondary => const Color(0xFF6C7E8B);

  @override
  Color get textDisabled => _grey300;

  @override
  Color get textSuccess => _green100;

  final Color _grey950 = const Color(0xFF24282D);

  @override
  Color get iconPrimary => _grey950;

  @override
  Color get textPrimary => _grey950;

  @override
  Color get surfacePrimaryLowered => const Color(0xFFF7F8F9);

  @override
  Color get surfaceSecondaryLowered => const Color(0xFFEDEFF1);

  @override
  Color get surfaceSuccess => _green100;

  @override
  Color get surfaceWarning => _orange30;

  @override
  Color get borderSuccess => const Color(0xFF00AF66);

  @override
  Color get surfaceBrandPale => const Color(0xFFCCEDFF);

  @override
  Color get surfaceErrorPale => const Color(0xFFFFDADA);

  @override
  Color get surfaceSuccessPale => const Color(0xFFCCEFE0);

  @override
  Color get surfaceWarningPale => const Color(0xFFEDEFF1);
}
