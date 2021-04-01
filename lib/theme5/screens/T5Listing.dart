import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/theme5/model/T5Models.dart';
import 'package:prokit_flutter/theme5/utils/T5Colors.dart';
import 'package:prokit_flutter/theme5/utils/T5Constant.dart';
import 'package:prokit_flutter/theme5/utils/T5DataGenerator.dart';
import 'package:prokit_flutter/theme5/utils/T5Extension.dart';
import 'package:prokit_flutter/theme5/utils/T5Strings.dart';
import 'package:prokit_flutter/theme5/utils/T5Widget.dart';

class T5Listing extends StatefulWidget {
  static var tag = "/T5Listing";

  @override
  T5ListingState createState() => T5ListingState();
}

class T5ListingState extends State<T5Listing> {
  int selectedPos = 1;
  List<T5Bill> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getListData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(t5LayoutBackgroundWhite);

    return Scaffold(
      backgroundColor: t5LayoutBackgroundWhite,
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: text(t5_history, textColor: t5TextColorPrimary, fontFamily: fontBold, fontSize: textSizeXLarge),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 18, bottom: 18),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    text("OCt", fontSize: textSizeSMedium),
                                    text(mListings[index].day, fontSize: textSizeLargeMedium, textColor: t5TextColorPrimary),
                                  ],
                                ),
                                Container(
                                  decoration: boxDecoration(radius: 8, showShadow: true),
                                  margin: EdgeInsets.only(left: 16, right: 16),
                                  width: width / 7.2,
                                  height: width / 7.2,
                                  child: SvgPicture.asset(mListings[index].icon),
                                  padding: EdgeInsets.all(width / 30),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          text(mListings[index].name, textColor: t5TextColorPrimary, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                          text(mListings[index].amount, textColor: t5TextColorPrimary, fontSize: textSizeMedium, fontFamily: fontSemibold)
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      ),
                                      text("Mastercard", fontSize: textSizeMedium)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 0.5,
                            color: t5ViewColor,
                          )
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
