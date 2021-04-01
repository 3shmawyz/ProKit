import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme8/utils/T8Colors.dart';
import 'package:prokit_flutter/theme8/utils/T8Constant.dart';
import 'package:prokit_flutter/theme8/utils/T8Extension.dart';
import 'package:prokit_flutter/theme8/utils/T8Strings.dart';
import 'package:prokit_flutter/theme8/utils/T8Widget.dart';

class T8SignIn extends StatefulWidget {
  static String tag = '/T8SignIn';

  @override
  T8SignInState createState() => T8SignInState();
}

class T8SignInState extends State<T8SignIn> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(t8_app_background);
    return Scaffold(
      backgroundColor: t8_app_background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: t8_app_background,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                text(t8_title_login, fontSize: textSizeNormal, fontFamily: fontBold),
                text(t8_info_login, textColor: t8_textColorSecondary, isLongText: true),
                Container(
                  margin: EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: t8_white, color: t8_white, showShadow: true, radius: 10),
                  child: Column(
                    children: <Widget>[
                      d8EditTextStyle(t8_hint_your_email, isPassword: false),
                      d8Divider(),
                      d8EditTextStyle(t8_hint_your_password),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                text(t8_lbl_don_t_have_an_account),
                text(t8_lbl_create_account, textColor: t8_colorPrimary),
                SizedBox(
                  height: 80,
                ),
                Container(margin: EdgeInsets.all(24.0), child: T8Button(textContent: t8_lbl_create_account, onPressed: () {}))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
