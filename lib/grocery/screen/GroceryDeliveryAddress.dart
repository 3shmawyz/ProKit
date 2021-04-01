import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/grocery/utils/GroceryExtension.dart';
import 'package:prokit_flutter/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/grocery/utils/GroceryWidget.dart';

class GroceryDeliveryAddress extends StatefulWidget {
  static String tag = '/GroceryDeliveryAddress';

  @override
  _GroceryDeliveryAddressState createState() => _GroceryDeliveryAddressState();
}

class _GroceryDeliveryAddressState extends State<GroceryDeliveryAddress> {
  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  String selectedLocation1 = "Pannipitiya";
  String selectedLocation2 = "Egodawatta";

  List<String> location1 = ["Pannipitiya"];

  List<String> location2 = ["Egodawatta"];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(grocery_color_white);
    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity,65),
        child: title1(grocery_lbl_Delivery_Address, grocery_color_white,
            grocery_textColorPrimary, context),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          decoration: BoxDecoration(
              color: grocery_color_white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: grocery_ShadowColor,
                    blurRadius: 20.0,
                    offset: Offset(0.0, 0.9))
              ]),
          child: Column(
            children: <Widget>[
              Container(
                width: width,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: boxDecoration(
                          radius: 25.0, bgColor: grocery_orangeLight_Color),
                      child: Image.asset(
                        Grocery_ic_Home,
                        height: 10,
                        width: 10,
                        color: grocery_color_white,
                      ).paddingAll(12),
                    ).paddingOnly(
                        top: spacing_control,
                        left: spacing_standard_new,
                        bottom: spacing_control,
                        right: spacing_standard),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text("Enter delivery address",
                                  fontSize: 22.0, fontFamily: fontMedium)
                              .paddingOnly(
                            left: spacing_standard,
                            right: spacing_standard,
                          ),
                          text(
                            "Your Delivery address",
                            textColor: grocery_textColorSecondary,
                          ).paddingOnly(
                            left: spacing_standard,
                            right: spacing_standard,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    DropdownButton(
                      isExpanded: true,
                      value: selectedLocation1,
                      underline: Container(
                        height: 0,
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                      ),
                      style: TextStyle(
                          color: grocery_textColorPrimary,
                          fontSize: textSizeLargeMedium,
                          fontFamily: fontRegular),
                      onChanged: (String newValue) {
                        setState(() {
                          selectedLocation1 = newValue;
                        });
                      },
                      items: location1
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      itemHeight: 50,
                    ),
                    Divider(
                      height: 20,
                    ),
                  ],
                ),
              ).paddingOnly(
                  top: spacing_standard_new,
                  left: spacing_standard_new,
                  right: spacing_standard_new),
              Container(
                child: Column(
                  children: <Widget>[
                    DropdownButton(
                      isExpanded: true,
                      value: selectedLocation2,
                      underline: Container(
                        height: 0,
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                      ),
                      style: TextStyle(
                          color: grocery_textColorPrimary,
                          fontSize: textSizeLargeMedium,
                          fontFamily: fontRegular),
                      onChanged: (String newValue) {
                        setState(() {
                          selectedLocation2 = newValue;
                        });
                      },
                      items: location2
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      itemHeight: 50,
                    ),
                    Divider(
                      height: 20,
                    ),
                  ],
                ),
              ).paddingOnly(
                  top: spacing_standard_new,
                  left: spacing_standard_new,
                  right: spacing_standard_new),
              EditText(
                text: "424/ 1D, Palanwattam, Pannipitiya",
                isPassword: false,
              ).paddingOnly(
                  top: spacing_standard,
                  left: spacing_standard_new,
                  right: spacing_standard_new),
              SizedBox(
                height: spacing_standard_new,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  child: groceryButton(
                    textContent: grocery_lbl_Save,
                    color: grocery_colorPrimary,
                    onPressed: (() {}),
                  ).paddingOnly(
                      right: spacing_standard_new,
                      bottom: spacing_standard_new),
                ).paddingOnly(
                    top: spacing_standard_new, bottom: spacing_standard_new),
              )
            ],
          ),
        ),
      ),
    );
  }
}
