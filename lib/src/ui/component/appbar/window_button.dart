import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grassh_renew/src/ui/icons/codicon.dart';
import 'package:grassh_renew/src/util/platform.dart';
import 'package:window_manager/window_manager.dart';

class WindowButton extends StatefulWidget {
  const WindowButton({super.key});

  @override
  State<WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<WindowButton> with WindowListener {
  bool _isMaximized = false;

  _maximized() async {
    if (await windowManager.isMaximized()) {
      await windowManager.unmaximize();
    } else {
      await windowManager.maximize();
    }
    _isMaximized = await windowManager.isMaximized();
    setState(() {});
  }

  _minimized() async {
    await windowManager.minimize();
  }

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    () async {
      _isMaximized = await windowManager.isMaximized();
    }();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Buttons only show on PC
    if (PlatformUtil.isPC) {
      return Row(
        children: [
          Button(
            color: Colors.green,
            hoverColor: Platform.isWindows
                ? Colors.grey.withAlpha(80)
                : Colors.green.shade700,
            icon: Codicon.chromeMinimize,
            callback: Platform.isWindows ? _minimized : _maximized,
          ),
          !Platform.isWindows
              ? const SizedBox(
                  width: 10,
                )
              : const SizedBox(),
          Button(
            color: Colors.yellow.shade600,
            hoverColor: Platform.isWindows
                ? Colors.grey.withAlpha(80)
                : Colors.yellow.shade800,
            icon: _isMaximized ? Codicon.chromeRestore : Codicon.chromeMaximize,
            callback: Platform.isWindows ? _maximized : _minimized,
          ),
          !Platform.isWindows
              ? const SizedBox(
                  width: 10,
                )
              : const SizedBox(),
          Button(
            color: Colors.red,
            hoverColor: Colors.red.shade700,
            icon: Codicon.chromeClose,
            callback: () {
              windowManager.close();
            },
          ),
          !Platform.isWindows
              ? const SizedBox(
                  width: 10,
                )
              : const SizedBox(),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  void onWindowEvent(String event) {
    switch (event) {
      case 'maximized':
      case 'unmaximized':
        () async {
          _isMaximized = await windowManager.isFocused();
          setState(() {});
        }();
    }
  }
}

class Button extends StatefulWidget {
  final Color? color;
  final Color? hoverColor;

  final void Function()? callback;
  final IconData? icon;

  const Button({
    super.key,
    this.color,
    required this.hoverColor,
    this.callback,
    this.icon,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with WindowListener {
  bool _isHover = false;
  bool _isFocus = true;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  Color? getColor() {
    if (Platform.isWindows) {
      if (_isHover) {
        return widget.hoverColor;
      }
      return null;
    } else {
      if (!_isFocus) {
        return Colors.grey.withAlpha(80);
      }
      if (_isHover) {
        return widget.hoverColor;
      }
      return widget.color;
    }
  }

  Color? getIconColor() {
    if (Platform.isWindows) {
      if (!_isFocus) {
        return Colors.grey;
      }
      return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Widget? button;
    if (Platform.isWindows) {
      // Windows Button
      button = AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
        width: 45,
        height: 30,
        decoration: BoxDecoration(
          color: getColor(),
        ),
        child: Icon(
          widget.icon,
          color: getIconColor(),
          size: 15,
        ),
      );
    } else {
      // MacOS & Linux Button
      button = AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: getColor(),
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }
    return Listener(
      onPointerDown: (e) {
        if (e.buttons == kPrimaryButton) {
          _isPressed = true;
        }
      },
      onPointerCancel: (e) {
        _isPressed = false;
      },
      onPointerUp: (e) {
        if (_isPressed) {
          widget.callback?.call();
          _isPressed = false;
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onExit: (e) {
          setState(() {
            _isHover = false;
          });
        },
        onEnter: (e) {
          setState(() {
            _isHover = true;
          });
        },
        child: button,
      ),
    );
  }

  @override
  void onWindowEvent(String event) {
    switch (event) {
      case 'focus':
      case 'blur':
        () async {
          final bool isFocused = await windowManager.isFocused();
          setState(() {
            _isFocus = isFocused;
          });
        }();
    }
  }
}
