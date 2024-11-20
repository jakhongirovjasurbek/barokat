import 'package:barokat/core/theme/text_style/styles.dart';
import 'package:flutter/material.dart';

final class TextStyleX implements AppTextStyles {
  late TextStyle _text2Xs;
  late TextStyle _textXs;
  late TextStyle _textSm;
  late TextStyle _textBase;
  late TextStyle _textLg;
  late TextStyle _textXl;
  late TextStyle _text2Xl;
  late TextStyle _text3Xl;
  late TextStyle _text4Xl;
  late TextStyle _text5Xl;

  TextStyleX({
    required TextStyle text2Xs,
    required TextStyle textXs,
    required TextStyle textSm,
    required TextStyle textBase,
    required TextStyle textLg,
    required TextStyle textXl,
    required TextStyle text2Xl,
    required TextStyle text3Xl,
    required TextStyle text4Xl,
    required TextStyle text5Xl,
  }) {
    _text2Xs = text2Xs;
    _textXs = textXs;
    _textSm = textSm;
    _textBase = textBase;
    _textLg = textLg;
    _textXl = textXl;
    _text2Xl = text2Xl;
    _text3Xl = text3Xl;
    _text4Xl = text4Xl;
    _text5Xl = text5Xl;
  }

  @override
  TextStyle get text2Xs => _text2Xs;

  @override
  TextStyle get textXs => _textXs;

  @override
  TextStyle get textSm => _textSm;

  @override
  TextStyle get textBase => _textBase;

  @override
  TextStyle get textLg => _textLg;

  @override
  TextStyle get textXl => _textXl;

  @override
  TextStyle get text2Xl => _text2Xl;

  @override
  TextStyle get text3Xl => _text3Xl;

  @override
  TextStyle get text4Xl => _text4Xl;

  @override
  TextStyle get text5Xl => _text5Xl;
}
