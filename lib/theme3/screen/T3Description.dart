import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/theme3/utils/Extension.dart';
import 'package:prokit_flutter/theme3/utils/T3Constant.dart';
import 'package:prokit_flutter/theme3/utils/T3Images.dart';
import 'package:prokit_flutter/theme3/utils/colors.dart';
import 'package:prokit_flutter/theme3/utils/strings.dart';
import 'package:prokit_flutter/theme3/utils/widgets.dart';

class T3Description extends StatefulWidget {
  static String tag = '/T3Description';

  @override
  T3DescriptionState createState() => T3DescriptionState();
}

class T3DescriptionState extends State<T3Description> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              titleSpacing: 0,
              backgroundColor: t3_colorPrimary,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              title: text(t3_lbl_food_recipe_detail,
                  textColor: t3_white, fontSize: 22.0, fontFamily: fontBold),
              flexibleSpace: FlexibleSpaceBar(
                  background: CachedNetworkImage(
                      imageUrl: t3_ic_dish2, fit: BoxFit.cover)),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    headingText(t3_text_cheese_roll_done_by_john_doe),
                    SvgPicture.asset(t3_ic_favourite, color: t3_red)
                  ],
                ),
                SizedBox(height: 16),
                text(t3_lbl_share_to,
                    textColor: t3_textColorPrimary,
                    fontSize: textSizeSMedium,
                    fontFamily: fontMedium),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    SvgPicture.asset(t3_ic_wp, height: 24, width: 24),
                    SizedBox(width: 10),
                    Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child:
                            Image.asset(t3_ic_facebook, height: 24, width: 24)),
                    SizedBox(width: 10),
                    SvgPicture.asset(t3_ic_instagram, height: 24, width: 24),
                    SizedBox(width: 10),
                    Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child:
                            Image.asset(t3_ic_linkedin, height: 24, width: 24)),
                  ],
                ),
                SizedBox(height: 16),
                text(t3_lbl_recipe_steps,
                    textColor: t3_textColorPrimary,
                    fontSize: textSizeSMedium,
                    fontFamily: fontMedium),
                SizedBox(height: 8),
                Container(
                    margin: EdgeInsets.only(left: 16),
                    child: text(t3_lbl_desc,
                        textColor: t3_textColorPrimary,
                        fontSize: textSizeMedium,
                        islongTxt: true)),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: AppButton(
                    textContent: t3_lbl_check_video,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
