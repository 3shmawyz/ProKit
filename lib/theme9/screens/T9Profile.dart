import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/theme9/utils/T9Colors.dart';
import 'package:prokit_flutter/theme9/utils/T9Constant.dart';
import 'package:prokit_flutter/theme9/utils/T9Extension.dart';
import 'package:prokit_flutter/theme9/utils/T9Images.dart';
import 'package:prokit_flutter/theme9/utils/T9Strings.dart';
import 'package:prokit_flutter/theme9/utils/T9Widget.dart';

class T9Profile extends StatefulWidget {
  static String tag = '/T9Profile';

  @override
  T9ProfileState createState() => T9ProfileState();
}

class T9ProfileState extends State<T9Profile> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(t9_layout_background);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: t9_layout_background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: t9_white, width: 4)),
                      child: CircleAvatar(
                          backgroundImage:
                              CachedNetworkImageProvider(t9_ic_profile),
                          radius: width / 8.5),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text("Nimasha Perara", fontFamily: fontMedium),
                        text(t9_lbl_390_290_points),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            t9Award(t9_ic_medal, t9_colorPrimary),
                            t9Award(t9_ic_crown, t9_green),
                            t9Award(t9_ic_cup, t9_light_pink),
                            t9Award(t9_ic_flag, t9_orange_dark),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 30, left: 16),
                  child: text(t9_lbl_general,
                      fontFamily: fontBold, textAllCaps: true)),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: boxDecoration(
                    bgColor: t9_white, showShadow: true, radius: 0),
                child: Column(
                  children: <Widget>[
                    t9Option(t9_ic_heart, t9_lbl_favourite_courses),
                    t9Option(t9_ic_user, t9_lbl_my_friends),
                    t9Option(t9_ic_achievements, t9_lbl_achievements),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 25, left: 16),
                  child: text(t9_lbl_settings,
                      fontFamily: fontBold, textAllCaps: true)),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: boxDecoration(
                    bgColor: t9_white, showShadow: true, radius: 0),
                child: Column(
                  children: <Widget>[
                    t9Option(t9_ic_key, t9_lbl_edit_login_details),
                    t9Option(t9_ic_correct, t9_lbl_update_interests),
                    t9Option(t9_ic_block, t9_lbl_blocked_users),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget t9Award(var icon, var bgColor) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: 35,
    height: 35,
    decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CachedNetworkImage(
        imageUrl: icon,
      ),
    ),
  );
}

Widget t9Option(var icon, var heading) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration:
                  boxDecoration(bgColor: t9_white, radius: 8, showShadow: true),
              width: 40,
              height: 40,
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(
                icon,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            text(heading),
          ],
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: t9_textColorSecondary,
        ),
      ],
    ),
  );
}
