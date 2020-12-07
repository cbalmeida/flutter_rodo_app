import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rodo_app/palette.dart';

class InitialHomeScreen extends StatefulWidget {
  InitialHomeScreen({Key key, @required this.onClickButtonSearchByVehicleType}) : super(key: key);

  final Function(BuildContext context) onClickButtonSearchByVehicleType;

  _InitialHomeScreenState state;

  @override
  _InitialHomeScreenState createState() {
    state = _InitialHomeScreenState();
    return state;
  }
}

class _InitialHomeScreenState extends State<InitialHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Palette.appBackgroundColor,
        child: Stack(
          children: [
            getRodoLogoWidget(context),
            getSearchEditWidget(context),
            getSearchByTypeButtonWidget(context),
            getDealsOfTheDayButtonWidget(context),
          ],
        ),
      ),
    );
  }

  Widget getSizedBoxLeftMargin(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - searchTextEditWidth) / 2,
    );
  }

  // region LOGO

  double logoTop = 160;

  Widget getRodoLogoWidget(BuildContext context) {
    return Positioned(
      top: logoTop - MediaQuery.of(context).padding.top,
      child: Row(
        children: [
          getSizedBoxLeftMargin(context),
          Image.asset(
            "lib/assets/rodo.png",
            width: searchTextEditWidth,
            isAntiAlias: true,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }

  // endregion

  // region SEARCH EDIT

  double searchTextEditWidth = 330;
  double searchTextEditHeight = 45.86;
  double searchTextEditTop = 270;

  TextEditingController searchTextEditingController = TextEditingController();

  Widget getSearchEditWidget(BuildContext context) {
    return Positioned(
      top: searchTextEditTop - MediaQuery.of(context).padding.top,
      child: Row(
        children: [
          getSizedBoxLeftMargin(context),
          Container(
            width: searchTextEditWidth,
            height: searchTextEditHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999999),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: TextField(
              controller: searchTextEditingController,
              style: TextStyle(
                color: Palette.appBackgroundColor,
              ),
              decoration: InputDecoration(
                hintText: "SEARCH MAKE AND MODEL",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // endregion

  // region SEARCH BY TYPE BUTTON

  double searchByTypeButtonTop = 395;

  Widget getSearchByTypeButtonWidget(BuildContext context) {
    return Positioned(
      top: searchByTypeButtonTop - MediaQuery.of(context).padding.top,
      child: Row(
        children: [
          getSizedBoxLeftMargin(context),
          Container(
            width: searchTextEditWidth,
            height: searchTextEditHeight,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999999.0),
                side: BorderSide(
                  color: Palette.appForegroundColor,
                  width: 1.5,
                ),
              ),
              color: Colors.transparent,
              textColor: Palette.appForegroundColor,
              padding: EdgeInsets.all(0.0),
              onPressed: () {
                widget.onClickButtonSearchByVehicleType(context);
              },
              child: Text(
                'SEARCH BY VEHICLE TYPE'.toUpperCase(),
                style: TextStyle(
                  color: Palette.appForegroundColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // endregion

  // region DEALS OF THE DAY BUTTON

  Widget getDealsOfTheDayButtonWidget(BuildContext context) {
    // this button is 146.14 from the bottom of search edit.
    // searchedit's top is 270 and height is 45.86
    // so dealsOfTheDayButtonTop = 270 + 45.86 + 146.14
    double dealsOfTheDayButtonTop = searchTextEditHeight + searchTextEditTop + 146.14;

    return Positioned(
      top: dealsOfTheDayButtonTop - MediaQuery.of(context).padding.top,
      child: Row(
        children: [
          getSizedBoxLeftMargin(context),
          Container(
            width: searchTextEditWidth,
            height: searchTextEditHeight,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999999.0),
                side: BorderSide(
                  color: Palette.appForegroundColor,
                  width: 1.5,
                ),
              ),
              color: Colors.transparent,
              textColor: Palette.appForegroundColor,
              padding: EdgeInsets.all(0.0),
              onPressed: () {},
              child: Text(
                'SEE DEALS OF THE DAY'.toUpperCase(),
                style: TextStyle(
                  color: Palette.appForegroundColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// endregion

}
