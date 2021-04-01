import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/theme4/models/T4Models.dart';
import 'package:prokit_flutter/theme4/utils/T4Colors.dart';
import 'package:prokit_flutter/theme4/utils/T4Constant.dart';
import 'package:prokit_flutter/theme4/utils/T4DataGenerator.dart';
import 'package:prokit_flutter/theme4/utils/T4Extension.dart';
import 'package:prokit_flutter/theme4/utils/T4Images.dart';
import 'package:prokit_flutter/theme4/utils/T4Strings.dart';
import 'package:prokit_flutter/theme4/utils/T4Widgets.dart';

class T4Profile extends StatefulWidget {
  static var tag = "/T4Profile";

  @override
  T4ProfileState createState() => T4ProfileState();
}

class T4ProfileState extends State<T4Profile> {
  int selectedPos = 1;
  List<T4NewsModel> mListings;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mListings = getList1Data();
  }

  Widget getItem(String name, String icon) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(
                    icon,
                    width: 20,
                    height: 20,
                    color: t4_colorPrimary,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  text(name, textColor: t4_textColorPrimary)
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_right),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: divider(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(t4_app_background);

    return Scaffold(
      backgroundColor: t4_app_background,
      body: Container(
        child: Column(
          children: <Widget>[
            TopBar(t4_lbl_profile),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: boxDecoration(radius: 8, showShadow: true),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: t4_profile_covr_page,
                          height: height * 0.3,
                          fit: BoxFit.fill,
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: height * 0.225,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(
                                  width: 24,
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: t4_white),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        CachedNetworkImageProvider(t4_profile),
                                    radius: width * 0.15,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    text(t4_username,
                                        textColor: t4_textColorPrimary,
                                        fontFamily: fontBold,
                                        fontSize: textSizeLargeMedium),
                                    text(t4_designation,
                                        fontFamily: fontMedium,
                                        fontSize: textSizeMedium),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            getItem(t4_lbl_offer, t4_home),
                            getItem(t4_lbl_notification, t4_bell),
                            getItem(t4_lbl_terms_conditions, t4_file),
                            getItem(t4_lbl_help_support, t4_help),
                            getItem(t4_lbl_logout, t4_logout),
                            SizedBox(
                              height: 24,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
