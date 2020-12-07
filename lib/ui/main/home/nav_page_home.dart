import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rodo_app/model/vehicle_type.dart';
import 'package:flutter_rodo_app/ui/main/home/initial_home_screen.dart';
import 'package:flutter_rodo_app/ui/main/home/search_vehicle_type_screen.dart';
import 'package:flutter_rodo_app/ui/main/home/vehicle_type_screen.dart';
import '../../../widgets/nav_page.dart';
import '../main_nav_page.dart';

class NavPageHome extends StatefulWidget implements NavPage {
  NavPageHome({Key key, @required this.mainNavPage}) : super(key: key);

  MainNavPage mainNavPage;

  _NavPageHomeState state;

  @override
  _NavPageHomeState createState() {
    state = _NavPageHomeState();
    return state;
  }

  @override
  bool getPageBadge() {
    return state != null ? state.badge : false;
  }

  @override
  IconData getPageIcon() {
    return CupertinoIcons.house;
  }

  @override
  IconData getPageIconSelected() {
    return CupertinoIcons.house_fill;
  }

  @override
  String getPageLabel() {
    return "Home";
  }
}

class _NavPageHomeState extends State<NavPageHome> {
  bool badge = false;

  final List<Widget> screenList = List<Widget>();

  //SearchVehicleTypeScreen searchVehicleTypeScreen;
  //InitialHomeScreen initialHomeScreen;

  @override
  void initState() {
    super.initState();
    screenList.insert(0, InitialHomeScreen(
      onClickButtonSearchByVehicleType: (context) {
        showSearchByTypeScreen(context);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return screenList[0];
  }

  void showSearchByTypeScreen(BuildContext context) {
    setState(() {
      screenList.insert(
        0,
        SearchVehicleTypeScreen(
          onPressBack: (BuildContext context) {
            setState(() {
              screenList.removeAt(0);
            });
          },
          onItemClick: (BuildContext context, VehicleType vehicleType) {
            showVehicleTypeScreen(context, vehicleType);
          },
        ),
      );
    });
  }

  void showVehicleTypeScreen(BuildContext context, VehicleType vehicleType) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => VehicleTypeScreen(
          vehicleType: vehicleType,
          onPressBack: (BuildContext context) {
            Navigator.pop(context, null);
          },
        ),
      ),
    );
    /*
    setState(() {
      screenList.insert(
        0,
        VehicleTypeScreen(
          vehicleType: vehicleType,
          onPressBack: (BuildContext context) {
            setState(() {
              screenList.removeAt(0);
            });
          },
        ),
      );
    });
     */
  }
}
