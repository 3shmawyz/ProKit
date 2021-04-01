import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/food/model/FoodModel.dart';
import 'package:prokit_flutter/food/utils/FoodColors.dart';
import 'package:prokit_flutter/food/utils/FoodConstant.dart';
import 'package:prokit_flutter/food/utils/FoodDataGenerator.dart';
import 'package:prokit_flutter/food/utils/FoodExtension.dart';
import 'package:prokit_flutter/food/utils/FoodString.dart';
import 'package:prokit_flutter/food/utils/FoodWidget.dart';

import 'FoodDashboard.dart';

class FoodCreateAccount extends StatefulWidget {
  static String tag = '/FoodCreateAccount';

  @override
  FoodCreateAccountState createState() => FoodCreateAccountState();
}

class FoodCreateAccountState extends State<FoodCreateAccount> {
  List<images> mList;

  @override
  void initState() {
    super.initState();
    mList = addUserPhotosData();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_white);

    var width = MediaQuery.of(context).size.width;

    var mLabel = Container(
      margin: EdgeInsets.only(
          left: spacing_standard_new, right: spacing_standard_new),
      child: text(food_lbl_create_your_account_and_nget_99_money,
          fontFamily: fontBold, isLongText: true, fontSize: textSizeLarge),
    );

    var mSubLabel = Container(
      margin: EdgeInsets.only(
          left: spacing_standard_new, right: spacing_standard_new),
      child: text(food_lbl_its_s_super_quick, isLongText: true),
    );

    Widget mMobile() {
      return Container(
        margin: EdgeInsets.all(spacing_standard_new),
        decoration: boxDecoration(
            color: food_colorPrimary, showShadow: true, radius: 50),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16.0),
                      isDense: true,
                      hintText: food_hint_mobile_no,
                      border: InputBorder.none)),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  launchScreen(context, FoodDashboard.tag);
                },
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: gradientBoxDecoration(
                      radius: 50,
                      gradientColor1: food_color_blue_gradient1,
                      gradientColor2: food_color_blue_gradient2),
                  child: Icon(Icons.arrow_forward, color: food_white),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: food_white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: width,
              alignment: Alignment.topLeft,
              color: food_white,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  back(context);
                },
              ),
            ),
            SizedBox(height: spacing_standard_new),
            mLabel,
            mSubLabel,
            SizedBox(height: 30.0),
            SizedBox(
              height: width * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: spacing_standard_new),
                    child: CircleAvatar(
                        backgroundImage:
                            CachedNetworkImageProvider(mList[index].image),
                        radius: 45),
                  );
                },
              ),
            ),
            SizedBox(height: spacing_large),
            mMobile()
          ],
        ),
      ),
    );
  }
}
