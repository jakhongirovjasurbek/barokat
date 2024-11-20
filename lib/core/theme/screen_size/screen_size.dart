// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class ScreenSize {
  const ScreenSize._();
  static late double w2;
  static late double w4;
  static late double w6;
  static late double w8;
  static late double w10;
  static late double w12;
  static late double w14;
  static late double w16;
  static late double w20;
  static late double w24;
  static late double w32;
  static late double w36;
  static late double w48;
  static late double w52;

  static late double h2;
  static late double h4;
  static late double h6;
  static late double h8;
  static late double h10;
  static late double h12;
  static late double h14;
  static late double h16;
  static late double h18;
  static late double h22;
  static late double h20;
  static late double h24;
  static late double h26;
  static late double h32;
  static late double h36;
  static late double h40;
  static late double h48;
  static late double h58;
  static late double h70;
  static late double r4;
  static late double r6;
  static late double r8;
  static late double r12;
  static late double r16;
  static late double r24;
  static late double r32;
  static late double r56;

  static double adaptiveViewPadding(BuildContext context) {
    if (MediaQuery.viewPaddingOf(context).bottom == 0) {
      return h24;
    } else {
      return MediaQuery.viewPaddingOf(context).bottom;
    }
  }

  static double adaptiveViewInsets(BuildContext context) {
    if (MediaQuery.viewInsetsOf(context).bottom == 0) {
      return h24;
    } else {
      return MediaQuery.viewInsetsOf(context).bottom + h24;
    }
  }

  static Future<void> setSizes() async {
    w2 = 2.w;
    w4 = 4.w;
    w6 = 6.w;
    w8 = 8.w;
    w10 = 10.w;
    w12 = 12.w;
    w14 = 14.w;
    w16 = 16.w;
    w20 = 20.w;
    w24 = 24.w;
    w32 = 32.w;
    w36 = 36.w;
    w48 = 48.w;
    w52 = 52.w;

    h2 = 2.h;
    h4 = 4.h;
    h6 = 6.h;
    h8 = 8.h;
    h10 = 10.h;
    h12 = 12.h;
    h14 = 14.h;
    h16 = 16.h;
    h18 = 18.h;
    h22 = 22.h;
    h20 = 20.h;
    h24 = 24.h;
    h26 = 26.h;
    h32 = 32.h;
    h36 = 36.h;
    h40 = 40.h;
    h48 = 48.h;
    h58 = 58.h;
    h70 = 70.h;
    r4 = 4.r;
    r6 = 6.r;
    r8 = 8.r;
    r12 = 12.r;
    r16 = 16.r;
    r24 = 24.r;
    r32 = 32.r;
    r56 = 56.r;
  }
}
