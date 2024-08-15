import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final Widget? child;
  final double width;
  const SideBar({
    super.key,
    required this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastEaseInToSlowEaseOut,
      width: width,
      child: Center(
        child: child,
      ),
    );
  }
}
