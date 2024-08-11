import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DragToMoveArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 25);
}
