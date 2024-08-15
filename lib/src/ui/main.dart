import 'package:flutter/material.dart';
import 'package:grassh_renew/src/ui/component/sidebar/left.dart';
import 'component/appbar/main.dart' as bar;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const bar.AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeftSideBar(
              controller: LeftSideBarController(),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
