import 'package:flutter/material.dart';
import 'component/appbar/main.dart' as bar;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: bar.AppBar(),
      body: Row(),
    );
  }
}
