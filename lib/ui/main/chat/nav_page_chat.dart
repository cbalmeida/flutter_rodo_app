import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rodo_app/palette.dart';
import 'package:flutter_rodo_app/ui/main/main_nav_page.dart';

import '../../../widgets/nav_page.dart';

class NavPageChat extends StatefulWidget implements NavPage {
  NavPageChat({Key key, @required this.mainNavPage}) : super(key: key);

  MainNavPage mainNavPage;

  _NavPageChatState state;

  @override
  _NavPageChatState createState() {
    state = _NavPageChatState();
    return state;
  }

  @override
  bool getPageBadge() {
    return state != null ? state.badge : false;
  }

  @override
  IconData getPageIcon() {
    return CupertinoIcons.chat_bubble;
  }

  @override
  IconData getPageIconSelected() {
    return CupertinoIcons.chat_bubble_fill;
  }

  @override
  String getPageLabel() {
    return "Chat";
  }
}

class _NavPageChatState extends State<NavPageChat> {
  bool badge = true;

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
                //secondary: const Icon(Icons.lightbulb_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
