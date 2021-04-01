import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/social/model/SocialModel.dart';
import 'package:prokit_flutter/social/utils/SocialColors.dart';
import 'package:prokit_flutter/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/social/utils/SocialDataGenerator.dart';
import 'package:prokit_flutter/social/utils/SocialExtension.dart';
import 'package:prokit_flutter/social/utils/SocialWidget.dart';

import 'SocialHomeCalls.dart';

class SocialViewCall extends StatefulWidget {
  static String tag = '/SocialViewCall';

  @override
  SocialViewCallState createState() => SocialViewCallState();
}

class SocialViewCallState extends State<SocialViewCall> {
  List<SocialUser> mList;

  @override
  void initState() {
    super.initState();
    mList = addCallData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(social_white);
    return Scaffold(
      backgroundColor: social_app_background_color,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          mTop(context, ""),
          Container(
            margin: EdgeInsets.all(spacing_standard_new),
            decoration: boxDecoration(radius: spacing_middle),
            padding: EdgeInsets.all(spacing_middle),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Calls(mList[index], index);
                  // return Chats(mListings[index], index);
                }),
          ),
        ],
      )),
    );
  }
}
