import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rodo_app/model/vehicle_type.dart';
import 'package:flutter_rodo_app/palette.dart';

class VehicleTypeScreen extends StatefulWidget {
  VehicleTypeScreen({
    Key key,
    @required this.vehicleType,
    @required this.onPressBack,
  }) : super(key: key);

  Function(BuildContext context) onPressBack;

  final VehicleType vehicleType;

  _VehicleTypeScreenState state;

  @override
  _VehicleTypeScreenState createState() {
    state = _VehicleTypeScreenState();
    return state;
  }
}

class _VehicleTypeScreenState extends State<VehicleTypeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Palette.appBarToolbarHeight,
        elevation: 0,
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          widget.vehicleType.name,
          style: Palette.appBarTextStyle,
        ),
        backgroundColor: Colors.white,
        leadingWidth: Palette.backButtonLeadingWidth,
        leading: new IconButton(
            icon: new Icon(
              Palette.backButtonIconData,
              color: Colors.black,
              size: Palette.backButtonIconSize,
            ),
            // onPressed: () => Navigator.of(context).pop(),
            onPressed: () {
              widget.onPressBack(context);
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getItem(context),
          ],
        ),
      ),
    );
  }

  Widget getItem(BuildContext context) {
    return Container(
      child: Column(
        children: [
          widget.vehicleType.isImageAnAsset
              ? Image.asset(
                  widget.vehicleType.imagePath,
                  //width: 105,
                  height: 50.4,
                  isAntiAlias: true,
                  filterQuality: FilterQuality.high,
                )
              : Image.network(
                  widget.vehicleType.imagePath,
                  //width: 105,
                  height: 50.4,
                  isAntiAlias: true,
                  filterQuality: FilterQuality.high,
                ),
          Text(
            widget.vehicleType.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

// endregion

}
