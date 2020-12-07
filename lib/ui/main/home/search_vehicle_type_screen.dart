import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rodo_app/model/vehicle_type.dart';
import 'package:flutter_rodo_app/palette.dart';

class SearchVehicleTypeScreen extends StatefulWidget {
  SearchVehicleTypeScreen({
    Key key,
    @required this.onPressBack,
    @required this.onItemClick,
  }) : super(key: key);

  Function(BuildContext context) onPressBack;

  Function(BuildContext context, VehicleType vehicleType) onItemClick;

  _SearchVehicleTypeScreenState state;

  @override
  _SearchVehicleTypeScreenState createState() {
    state = _SearchVehicleTypeScreenState();
    return state;
  }
}

class _SearchVehicleTypeScreenState extends State<SearchVehicleTypeScreen> {
  Future<List<VehicleType>> vehicleTypes;

  @override
  void initState() {
    super.initState();
    vehicleTypes = fetchVehicleTypes();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      toolbarHeight: Palette.appBarToolbarHeight,
      elevation: 0,
      brightness: Brightness.light,
      centerTitle: true,
      title: Text(
        'Vehicle Type',
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
    );

    return Scaffold(
      appBar: appBar,

      // ---------
      // BODY
      // ---------
      body: Container(
        color: Palette.appBackgroundColor,
        child: getGridView(context, appBar),
      ),
    );
  }

  // region GRIDVIEW

  Widget getGridView(BuildContext context, AppBar appBar) {
    /*
      According to the layout we have:
      - horizontal distance between left border and the vehicle image (left padding): 52 pts
      - width of the each vehicle image: 105 pts
      - horizontal distance between each vehicle image: 57 pts
      considering iphone 8 has 375 pts of width, then we have
      |----------------------------------- 375 pts ---------------------------------------|
      |(padding: 52 pts)|(image: 105 pts)|(gap: 57 pts)|(image: 105 pts)|(padding: 56 pts)|

      PS: it will be better if both horizontal padding's were exactly the same width 54/54 to look symmetric!
          but to be more faithful as we can to the specs, we are going to keep them as 52/56.

      And each cell must have 83 pts of height:
      - 50.4 pts of the image
      - 32.6 pts of the vertical gap between images

      So we need to compute the cell's aspectRatio based on those parameters to be used on the gridview.gridDelegate:

     */

    var _screenWidth = MediaQuery.of(context).size.width; // screen's width
    var _crossAxisSpacing = 57.0; // horizontal gap between columns
    var _crossAxisCount = 2; // 2 columns
    var _paddingLeft = 52.0;
    var _paddingRight = 56.0;
    var _cellHeight = 83.0;
    var _mainAxisSpacing = 0.0;
    var _width = (_screenWidth - (_paddingLeft + _paddingRight) - ((_crossAxisCount - 1) * _crossAxisSpacing)) / _crossAxisCount;
    var _aspectRatio = _width / _cellHeight;

    // to compute the top padding we have to subtract the heigths of the statusbar(clock, battery, etc)
    // and the appbar (vehicle type) from the 111 pts of the specs.
    var _paddingTop = 111.0 - MediaQuery.of(context).padding.top - 70;

    return Padding(
      padding: EdgeInsets.only(left: _paddingLeft, right: _paddingRight, top: _paddingTop),
      child: FutureBuilder<List<VehicleType>>(
        future: vehicleTypes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _crossAxisCount,
                  crossAxisSpacing: _crossAxisSpacing,
                  mainAxisSpacing: _mainAxisSpacing,
                  childAspectRatio: _aspectRatio,
                ),
                itemBuilder: (context, index) {
                  return getItemGridView(context, snapshot.data[index]);
                });
          } else if (snapshot.hasError) {
            return Center(child: Text("Sorry but something went wrong!"));
          }
          return Center(child: Text("Loading..."));
        },
      ),
    );
  }

  // endregion

  // region ITEM GRIDVIEW

  Widget getItemGridView(BuildContext context, VehicleType vehicleType) {
    return InkWell(
      onTap: () {
        widget.onItemClick(context, vehicleType);
      },
      child: Container(
        child: Column(
          children: [
            vehicleType.isImageAnAsset
                ? Hero(
                    tag: "vehicleType.id." + vehicleType.id.toString(),
                    child: Image.asset(
                      vehicleType.imagePath,
                      //width: 105,
                      height: 50.4,
                      isAntiAlias: true,
                      filterQuality: FilterQuality.high,
                    ),
                  )
                : Hero(
                    tag: "vehicleType.id." + vehicleType.id.toString(),
                    child: Image.network(
                      vehicleType.imagePath,
                      //width: 105,
                      height: 50.4,
                      isAntiAlias: true,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
            Text(
              vehicleType.name,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

// endregion

  // region FETCH THE LIST OF VEHICLE TYPES

  Future<List<VehicleType>> fetchVehicleTypes() async {
    // final response = await http.get('http://..../api/vehicletypes');
    // if (response.statusCode == 200) {
    //  Iterable list = json.decode(response.body);
    //  return list.map((vehicletype) => VehicleType.fromJson(vehicletype)).toList();
    // } else {
    //  throw Exception('Failed to Load Post');
    // }
    return mockVehicleTypes();
  }

  Future<List<VehicleType>> mockVehicleTypes() async {
    // uncomment the line below if you want to simulate as we are waiting until retrieve data from server
    // await Future.delayed(Duration(milliseconds: 1500));

    // uncomment the line below if you want to simulate an error while retrieving data from server
    // throw Exception('Failed to Load Post');

    String jsonResponse = '[' +
        '{"id":1,"name":"Compact","image_path":"lib/assets/compact.png","is_image_an_asset":true},' +
        '{"id":2,"name":"MiniVan","image_path":"lib/assets/minivan.png","is_image_an_asset":true},' +
        '{"id":3,"name":"Convertible","image_path":"lib/assets/convertible.png","is_image_an_asset":true},' +
        '{"id":4,"name":"Sedan","image_path":"lib/assets/sedan.png","is_image_an_asset":true},' +
        '{"id":5,"name":"Coupe","image_path":"lib/assets/coupe.png","is_image_an_asset":true},' +
        '{"id":6,"name":"Small SUV","image_path":"lib/assets/smallsuv.png","is_image_an_asset":true},' +
        '{"id":7,"name":"Hatchback","image_path":"lib/assets/hatchback.png","is_image_an_asset":true},' +
        '{"id":8,"name":"Sports","image_path":"lib/assets/sports.png","is_image_an_asset":true},' +
        '{"id":9,"name":"Hybrid/Electric","image_path":"lib/assets/hybridelectric.png","is_image_an_asset":true},' +
        '{"id":10,"name":"SUV","image_path":"lib/assets/suv.png","is_image_an_asset":true},' +
        '{"id":11,"name":"Midsize","image_path":"lib/assets/midsize.png","is_image_an_asset":true},' +
        '{"id":12,"name":"Truck","image_path":"lib/assets/truck.png","is_image_an_asset":true}' +
        ']';

    Iterable list = json.decode(jsonResponse);
    return list.map((item) => VehicleType.fromJson(item)).toList();
  }

// endregion

}
