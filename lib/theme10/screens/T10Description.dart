import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme10/utils/T10Colors.dart';
import 'package:prokit_flutter/theme10/utils/T10Constant.dart';
import 'package:prokit_flutter/theme10/utils/T10Extension.dart';
import 'package:prokit_flutter/theme10/utils/T10Images.dart';
import 'package:prokit_flutter/theme10/utils/T10Strings.dart';
import 'package:prokit_flutter/theme10/utils/T10Widget.dart';

class T10Description extends StatefulWidget {
  static String tag = '/T10Description';

  @override
  T10DescriptionState createState() => T10DescriptionState();
}

class T10DescriptionState extends State<T10Description> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(t10_white);
    var width = MediaQuery.of(context).size.width;

    Widget mTag(var value) {
      return Container(
        decoration: boxDecoration(color: t10_view_color),
        padding: EdgeInsets.fromLTRB(spacing_standard_new, spacing_control,
            spacing_standard_new, spacing_control),
        child: text(value, textColor: t10_textColorSecondary),
      );
    }

    Widget mInfo() {
      return Container(
        margin: EdgeInsets.all(spacing_standard_new),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(theme10_sample_long_text,
                textColor: t10_textColorSecondary, isLongText: true),
            SizedBox(
              height: spacing_standard_new,
            ),
            Divider(
              height: 1,
              color: t10_view_color,
            ),
            SizedBox(
              height: spacing_standard_new,
            ),
            Row(
              children: <Widget>[
                mTag(theme10_lbl_bags),
                SizedBox(
                  width: spacing_standard_new,
                ),
                mTag(theme10_lbl_shoes),
                SizedBox(
                  width: spacing_standard_new,
                ),
                mTag(theme10_lbl_packs),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: t10_white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            T10TopBar(theme10_title_product_detail),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(spacing_standard_new),
                      child: Column(
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: t10_slider_3,
                            width: width,
                            height: width * 0.4,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: spacing_standard_new,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(theme10_nike_shoes,
                                  fontFamily: fontMedium,
                                  fontSize: textSizeNormal),
                              text(theme10_100,
                                  fontFamily: fontMedium,
                                  fontSize: textSizeNormal),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(theme10_from_boots_category,
                                  textColor: t10_textColorSecondary),
                              text(theme10__50,
                                  textColor: t10_textColorSecondary),
                            ],
                          )
                        ],
                      ),
                    ),
                    DefaultTabController(
                      child: TabBar(
                        unselectedLabelColor: t10_textColorSecondary,
                        indicatorColor: t10_colorPrimary,
                        labelColor: t10_colorPrimary,
                        tabs: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: text(
                              theme10_lbl_tabDescription,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: text(
                              theme10_lbl_tabSpecification,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: text(
                              theme10_lbl_tab_more_info,
                            ),
                          ),
                        ],
                      ),
                      length: 3,
                    ),
                    mInfo()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
