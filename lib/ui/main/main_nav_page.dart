import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rodo_app/palette.dart';
import 'package:flutter_rodo_app/ui/main/myorder/nav_page_myorder.dart';
import 'package:flutter_rodo_app/user_settings.dart';
import 'package:flutter_rodo_app/widgets/custom_tab_bar.dart';

import '../../widgets/nav_page.dart';
import 'chat/nav_page_chat.dart';
import 'home/nav_page_home.dart';
import 'settings/nav_page_settings.dart';
import 'showroom/nav_page_showroom.dart';

class MainNavPage extends StatefulWidget {
  MainNavPage({Key key}) : super(key: key);

  _MainNavPageState state;

  @override
  _MainNavPageState createState() {
    state = _MainNavPageState();
    return state;
  }

  void setPages(List<NavPage> pages) {
    pages.add(NavPageHome(mainNavPage: this));
    pages.add(NavPageChat(mainNavPage: this));
    pages.add(NavPageShowroom(mainNavPage: this));
    pages.add(NavPageMyOrder(mainNavPage: this));
    pages.add(NavPageSettings(mainNavPage: this));
  }
}

class _MainNavPageState extends State<MainNavPage> {
  int _selectedPage = 0;
  List<NavPage> _pages = List<NavPage>();

  @override
  void initState() {
    super.initState();
    widget.setPages(_pages);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            color: Palette.appBackgroundColor,
            child: IndexedStack(
              index: _selectedPage,
              children: _pages,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 0.0),
          color: Colors.white,
          child: CustomTabBar(
            pages: _pages,
            selectedIndex: _selectedPage,
            useForegroundColorIconWhenSelected: UserSettings.useForegroundColorIconWhenSelected,
            useFilledIconWhenSelected: UserSettings.useFilledIconWhenSelected,
            useIndicator: UserSettings.useIndicatorNavBar,
            showTextBelowIcon: UserSettings.showTextBelowIcon,
            onTap: (index) => setState(() {
              _selectedPage = index;
            }),
          ),
        ),
      ),
    );
  }
}
