import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme8/model/T8Models.dart';
import 'package:prokit_flutter/theme8/utils/T8Colors.dart';
import 'package:prokit_flutter/theme8/utils/T8Constant.dart';
import 'package:prokit_flutter/theme8/utils/T8Extension.dart';
import 'package:prokit_flutter/theme8/utils/T8Strings.dart';
import 'package:prokit_flutter/theme8/utils/T8Widget.dart';

class T8Search extends StatefulWidget {
  static String tag = '/T8Search';

  @override
  T8SearchState createState() => T8SearchState();
}

class T8SearchState extends State<T8Search> {
  List<T8QuizModel> mListings;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t8_app_background);
    return Scaffold(
      backgroundColor: t8_app_background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            t8TopBar(""),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                style: TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  hintText: t8_lbl_search,
                  filled: true,
                  fillColor: t8_white,
                  hintStyle: TextStyle(color: t8_view_color),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: t8_app_background, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: t8_app_background, width: 0.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
