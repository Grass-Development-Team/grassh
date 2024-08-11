import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grassh_renew/src/ui/component/appbar/window_button.dart';
import 'package:window_manager/window_manager.dart';

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const DragToMoveArea(
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
            SizedBox(width: 10),
            Text(
              "GrassH",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: SizedBox()),
            WindowButton(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 30);
}
