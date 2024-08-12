import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grassh_renew/src/ui/icons/codicon.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({super.key});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool isSidebarLeftOpen = false;
  bool isSidebarRightOpen = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Button(
          icon:
              isSidebarLeftOpen ? Codicon.sidebarLeft : Codicon.sidebarLeftOff,
          callback: () {
            setState(() {
              isSidebarLeftOpen = !isSidebarLeftOpen;
            });
          },
        ),
        const SizedBox(width: 5),
        Button(
          icon: isSidebarRightOpen
              ? Codicon.sidebarRight
              : Codicon.sidebarRightOff,
          callback: () {
            setState(() {
              isSidebarRightOpen = !isSidebarRightOpen;
            });
          },
        ),
      ],
    );
  }
}

class Button extends StatefulWidget {
  final void Function()? callback;
  final IconData? icon;

  const Button({
    super.key,
    this.callback,
    this.icon,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isHover = false;
  bool _isPressed = false;

  Color? getColor() {
    if (_isHover) {
      return Colors.grey.withAlpha(80);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease,
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: getColor(),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            widget.icon,
            size: 13,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
