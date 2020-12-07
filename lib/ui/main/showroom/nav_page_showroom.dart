import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rodo_app/palette.dart';
import '../../../widgets/nav_page.dart';
import '../main_nav_page.dart';

class NavPageShowroom extends StatefulWidget implements NavPage {
  NavPageShowroom({Key key, @required this.mainNavPage}) : super(key: key);

  MainNavPage mainNavPage;

  _NavPageShowroomState state;

  @override
  _NavPageShowroomState createState() {
    state = _NavPageShowroomState();
    return state;
  }

  @override
  bool getPageBadge() {
    return state != null ? state.badge : false;
  }

  @override
  IconData getPageIcon() {
    return CupertinoIcons.heart;
  }

  @override
  IconData getPageIconSelected() {
    return CupertinoIcons.heart_fill;
  }

  @override
  String getPageLabel() {
    return "Showroom";
  }
}

class _NavPageShowroomState extends State<NavPageShowroom> {
  bool badge = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          width: double.infinity,
          color: Palette.appBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.getPageLabel().toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SwitchListTile(
                title: Text("Show Icon badge"),
                value: badge,
                onChanged: (bool value) {
                  setState(() {
                    badge = value;
                    widget.mainNavPage.state.setState(() {});
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
