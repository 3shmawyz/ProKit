import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme8/utils/T8Colors.dart';
import 'package:prokit_flutter/theme8/utils/T8Constant.dart';
import 'package:prokit_flutter/theme8/utils/T8Extension.dart';
import 'package:prokit_flutter/theme8/utils/T8Strings.dart';
import 'package:prokit_flutter/theme8/utils/T8Widget.dart';

class T8Setting extends StatefulWidget {
  static String tag = '/T8Setting';

  @override
  T8SettingState createState() => T8SettingState();
}

class T8SettingState extends State<T8Setting> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(t8_app_background);
    return Scaffold(
      backgroundColor: t8_app_background,
      body: Column(
        children: <Widget>[
          t8TopBar(t8_lbl_setting),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: boxDecoration(bgColor: t8_white, radius: 8, showShadow: true),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        T8SettingOptionPattern1(Icons.person, t8_lbl_edit_profile, t8_username),
                        T8SettingOptionPattern1(Icons.email, t8_lbl_email, t8_email),
                        T8SettingOptionPattern1(Icons.vpn_key, t8_lbl_password, t8_sub_info_password),
                      ],
                    ),
                  ),
                  Container(
                    decoration: boxDecoration(bgColor: t8_white, radius: 8, showShadow: true),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: <Widget>[
                        T8SettingOptionPattern2(Icons.star, t8_lbl_scoreboard),
                        T8SettingOptionPattern2(Icons.add_box, t8_lbl_new_course),
                        T8SettingOptionPattern2(Icons.notifications, t8_lbl_study_reminder),
                      ],
                    ),
                  ),
                  Container(
                    decoration: boxDecoration(bgColor: t8_white, radius: 8, showShadow: true),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: <Widget>[
                        T8SettingOptionPattern3(Icons.help, t8_lbl_help),
                        T8SettingOptionPattern3(Icons.security, t8_lbl_privacy),
                        T8SettingOptionPattern3(Icons.chat_bubble, t8_lbl_contact_us),
                      ],
                    ),
                  ),
                  text(t8_lbl_logout, textColor: t8_colorPrimary, fontSize: textSizeLargeMedium, textAllCaps: true, fontFamily: fontBold)
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

Widget T8SettingOptionPattern1(var settingIcon, var heading, var info) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: t8_color_setting),
              width: 45,
              height: 45,
              padding: EdgeInsets.all(4),
              child: Icon(
                settingIcon,
                color: t8_white,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[text(heading), text(info, textColor: t8_textColorSecondary, fontSize: textSizeSMedium)],
            ),
          ],
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: t8_icon_color,
        )
      ],
    ),
  );
}

Widget T8SettingOptionPattern2(var icon, var heading) {
  bool isSwitched1 = false;

  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: t8_color_setting),
              width: 45,
              height: 45,
              padding: EdgeInsets.all(4),
              child: Icon(
                icon,
                color: t8_white,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            text(heading),
          ],
        ),
        Switch(
          value: isSwitched1,
          onChanged: (value) {
            // setState(() {
            isSwitched1 = value;
            //  });
          },
          activeTrackColor: t8_colorPrimary,
          activeColor: t8_view_color,
        )
      ],
    ),
  );
}

Widget T8SettingOptionPattern3(var icon, var heading) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: t8_color_setting),
              width: 45,
              height: 45,
              padding: EdgeInsets.all(4),
              child: Icon(
                icon,
                color: t8_white,
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
          color: t8_icon_color,
        )
      ],
    ),
  );
}
