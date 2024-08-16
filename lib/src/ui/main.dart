import 'package:flutter/material.dart';
import 'package:grassh_renew/src/config/global_config.dart';
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
          child: Stack(
            children: [
              Row(
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
              GlobalConfig.packageInfo.buildNumber != ""
                  ? Positioned(
                      right: 0,
                      bottom: 0,
                      child: Text(
                        "GrassH v${GlobalConfig.packageInfo.version}\nBuild ${GlobalConfig.packageInfo.buildNumber}. Not intended for external distribution.",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          )),
    );
  }
}
