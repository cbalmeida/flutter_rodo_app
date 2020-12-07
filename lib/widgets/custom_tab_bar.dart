import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rodo_app/palette.dart';
import 'package:flutter_rodo_app/user_settings.dart';

import 'nav_page.dart';

class CustomTabBar extends StatelessWidget {
  static const double navigationBarIconSize = 35;
  static const double navigationBarBadgeSize = 6;

  final List<NavPage> pages;
  final int selectedIndex;
  final Function(int) onTap;
  final bool useIndicator;
  final bool useForegroundColorIconWhenSelected;
  final bool useFilledIconWhenSelected;
  final bool showTextBelowIcon;

  const CustomTabBar({
    Key key,
    @required this.pages,
    @required this.selectedIndex,
    @required this.onTap,
    @required this.useIndicator,
    @required this.useForegroundColorIconWhenSelected,
    @required this.useFilledIconWhenSelected,
    @required this.showTextBelowIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UserSettings.showTextBelowIcon ? 66 : 56,
      child: TabBar(
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          border: useIndicator
              ? Border(
                  top: BorderSide(
                    color: Palette.appForegroundColor,
                    width: 3.0,
                  ),
                )
              : null,
        ),
        tabs: pages
            .asMap()
            .map((i, page) => MapEntry(
                  i,
                  Tab(
                      // TEXT BELLOW THE ICON
                      child: showTextBelowIcon
                          ? Text(
                              page.getPageLabel(),
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: (i == selectedIndex && useForegroundColorIconWhenSelected) ? Palette.appForegroundColor : Palette.bottomTabBarIconColor,
                              ),
                            )
                          : SizedBox.shrink(),
                      icon: Stack(
                        children: <Widget>[
                          // ICON
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: Icon(
                              (i == selectedIndex && useFilledIconWhenSelected) ? page.getPageIconSelected() : page.getPageIcon(),
                              color: (i == selectedIndex && useForegroundColorIconWhenSelected) ? Palette.appForegroundColor : Palette.bottomTabBarIconColor,
                              size: navigationBarIconSize,
                            ),
                          ),
                          page.getPageBadge()
                              ? // BADGE
                              Positioned(
                                  left: 2,
                                  top: 2,
                                  child: Container(
                                    padding: EdgeInsets.all(navigationBarBadgeSize),
                                    decoration: BoxDecoration(
                                      color: Palette.appForegroundColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: SizedBox.shrink(),
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      )),
                ))
            .values
            .toList(),
        onTap: onTap,
      ),
    );
  }
}
