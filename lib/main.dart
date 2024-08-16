import 'package:flutter/material.dart';
import 'package:grassh_renew/src/config/global_config.dart';
import 'package:grassh_renew/src/ui/main.dart';
import 'package:grassh_renew/src/util/platform.dart';
import 'package:grassh_renew/src/util/screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GlobalConfig.init();

  // Initialize PC Window
  if (PlatformUtil.isPC) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(
      size: Size(1000, ScreenUtil.height < 800 ? ScreenUtil.height : 800),
      minimumSize:
          Size(1000, ScreenUtil.height < 800 ? ScreenUtil.height : 800),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      title: "GrassH",
      windowButtonVisibility: false,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.maximize();
      await windowManager.show();
      await windowManager.focus();
      windowManager.setResizable(true);
    });
  }

  if (!PlatformUtil.isWeb) {
    runApp(const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF104E19),
          brightness: Brightness.dark,
        ),
        fontFamilyFallback: const [
          "Twemoji",
        ],
      ),
      home: const MainPage(),
    );
  }
}
