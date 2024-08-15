import 'package:flutter/material.dart';

class SideBarTab extends StatefulWidget {
  final void Function()? callback;
  final IconData? icon;
  final String? text;

  const SideBarTab({super.key, this.callback, this.icon, this.text});

  @override
  State<SideBarTab> createState() => _SideBarTabState();
}

class _SideBarTabState extends State<SideBarTab> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: GestureDetector(
          onTap: () {
            widget.callback?.call();
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (e) {
              _isHover = true;
              setState(() {});
            },
            onExit: (e) {
              _isHover = false;
              setState(() {});
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              width: MediaQuery.of(context).size.width,
              height: 30,
              decoration: BoxDecoration(
                color: _isHover ? Theme.of(context).highlightColor : null,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: ClipRect(
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Icon(
                        widget.icon,
                        size: 14,
                      ),
                      Positioned(
                        left: 20,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 104),
                          child: Text(
                            widget.text ?? "",
                            softWrap: false,
                            style: const TextStyle(
                              fontSize: 12,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
