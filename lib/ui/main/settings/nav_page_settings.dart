import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rodo_app/palette.dart';
import 'package:flutter_rodo_app/user_settings.dart';
import '../../../widgets/nav_page.dart';
import '../main_nav_page.dart';

class NavPageSettings extends StatefulWidget implements NavPage {
  NavPageSettings({Key key, @required this.mainNavPage}) : super(key: key);

  MainNavPage mainNavPage;

  _NavPageSettingsState state;

  @override
  _NavPageSettingsState createState() {
    state = _NavPageSettingsState();
    return state;
  }

  @override
  bool getPageBadge() {
    return state != null ? state.badge : false;
  }

  @override
  IconData getPageIcon() {
    return CupertinoIcons.gear_alt;
  }

  @override
  IconData getPageIconSelected() {
    return CupertinoIcons.gear_alt_fill;
  }

  @override
  String getPageLabel() {
    return "Settings";
  }
}

class _NavPageSettingsState extends State<NavPageSettings> {
  bool badge = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: Palette.appBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
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
              SwitchListTile(
                title: Text("Highlight Icon"),
                value: UserSettings.useForegroundColorIconWhenSelected,
                onChanged: (bool value) {
                  setState(() {
                    UserSettings.useForegroundColorIconWhenSelected = value;
                    widget.mainNavPage.state.setState(() {});
                  });
                },
              ),
              SwitchListTile(
                title: Text("Filled Icon"),
                value: UserSettings.useFilledIconWhenSelected,
                onChanged: (bool value) {
                  setState(() {
                    UserSettings.useFilledIconWhenSelected = value;
                    widget.mainNavPage.state.setState(() {});
                  });
                },
              ),
              SwitchListTile(
                title: Text("Show Indicator"),
                value: UserSettings.useIndicatorNavBar,
                onChanged: (bool value) {
                  setState(() {
                    UserSettings.useIndicatorNavBar = value;
                    widget.mainNavPage.state.setState(() {});
                  });
                },
              ),
              SwitchListTile(
                title: Text("Show Text"),
                value: UserSettings.showTextBelowIcon,
                onChanged: (bool value) {
                  setState(() {
                    UserSettings.showTextBelowIcon = value;
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
