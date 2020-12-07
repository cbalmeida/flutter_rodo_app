import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Palette {
  static const Color appBackgroundColor = Color(0xFF1a2f35);
  static const Color bottomTabBarIconColor = appBackgroundColor;

  static const Color appForegroundColor = Color(0xFF21cc65);

  static const IconData backButtonIconData = CupertinoIcons.chevron_left;
  static const double backButtonIconSize = 40;
  static const double backButtonLeadingWidth = 70;

  static const double appBarToolbarHeight = 70;
  static const TextStyle appBarTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 23,
  );
}
