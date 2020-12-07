import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rodo_app/palette.dart';
import '../../../widgets/nav_page.dart';
import '../main_nav_page.dart';

class NavPageMyOrder extends StatefulWidget implements NavPage {
  NavPageMyOrder({Key key, @required this.mainNavPage}) : super(key: key);

  MainNavPage mainNavPage;

  _NavPageMyOrderState state;

  @override
  _NavPageMyOrderState createState() {
    state = _NavPageMyOrderState();
    return state;
  }

  @override
  bool getPageBadge() {
    return state != null ? state.badge : false;
  }

  @override
  IconData getPageIcon() {
    return CupertinoIcons.arrow_up_doc;
  }

  @override
  IconData getPageIconSelected() {
    return CupertinoIcons.arrow_up_doc_fill;
  }

  @override
  String getPageLabel() {
    return "My Order";
  }
}

class _NavPageMyOrderState extends State<NavPageMyOrder> {
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
                //secondary: const Icon(Icons.lightbulb_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
