import 'package:flutter/material.dart';

class ScreenUtil {
  static final _window = WidgetsBinding.instance.platformDispatcher;

  static double width = _window.views.first.physicalSize.width;
  static double height = _window.views.first.physicalSize.height;
}
