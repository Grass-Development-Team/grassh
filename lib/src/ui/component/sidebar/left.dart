import 'package:flutter/material.dart';
import 'package:grassh_renew/src/ui/component/sidebar/main.dart';
import 'package:grassh_renew/src/ui/component/sidebar/tab.dart';

class LeftSideBar extends StatefulWidget {
  final LeftSideBarController controller;
  const LeftSideBar({super.key, required this.controller});

  @override
  State<LeftSideBar> createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar> {
  @override
  Widget build(BuildContext context) {
    return SideBar(
      width: widget.controller.isOpen ? 150 : 40,
      child: Column(
        children: [
          SideBarTab(
            callback: () {
              widget.controller.switchSidebar();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class LeftSideBarController {
  final void Function()? callback;

  LeftSideBarController({this.callback});

  bool _open = false;
  bool get isOpen => _open;

  open() {
    _open = true;
    callback?.call();
  }

  close() {
    _open = false;
    callback?.call();
  }

  switchSidebar() {
    _open ? close() : open();
  }
}
