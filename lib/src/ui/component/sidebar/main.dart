import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final Widget? child;
  const SideBar({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
    );
  }
}
