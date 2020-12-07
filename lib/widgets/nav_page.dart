import 'package:flutter/cupertino.dart';

abstract class NavPage extends Widget {
  IconData getPageIcon();

  IconData getPageIconSelected();

  String getPageLabel();

  bool getPageBadge();
}
