import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A util class for platform detection.
class PlatformUtil {
  static bool _isWeb() {
    return kIsWeb;
  }

  static bool _isMobile() {
    return _isWeb()
        ? false
        : (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia);
  }

  static bool _isPC() {
    return _isWeb()
        ? false
        : (Platform.isLinux || Platform.isMacOS || Platform.isWindows);
  }

  static bool get isWeb => _isWeb();
  static bool get isMobile => _isMobile();
  static bool get isPC => _isPC();
}

/// A widget that only shows on PC.
class OnlyPC extends StatelessWidget {
  final Widget child;

  const OnlyPC({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformUtil.isPC ? child : const SizedBox();
  }
}

/// A widget that only shows on mobile.
class OnlyMobile extends StatelessWidget {
  final Widget child;
  const OnlyMobile({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformUtil.isMobile ? child : const SizedBox();
  }
}
