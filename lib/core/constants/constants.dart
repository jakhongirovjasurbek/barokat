import 'dart:io';

import 'package:flutter/foundation.dart';

abstract final class Constants {
  static bool get _isIos => Platform.isIOS;

  static bool get _isAndroid => Platform.isAndroid;

  static bool get _isFuchsia => Platform.isFuchsia;

  static bool get _isMacOS => Platform.isMacOS;

  static bool get _isWindows => Platform.isWindows;

  static bool get _isLinux => Platform.isLinux;

  static const bool isWeb = kIsWeb;

  static bool get isMobile => _isIos || _isAndroid;

  static bool get isDesktop => _isMacOS || _isWindows || _isLinux || _isFuchsia;
}
