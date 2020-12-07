import 'package:flutter/material.dart';
import 'package:flutter_rodo_app/palette.dart';
import 'package:flutter_rodo_app/ui/main/main_nav_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rodo Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.appBackgroundColor,
      ),
      home: MainNavPage(),
    );
  }
}
