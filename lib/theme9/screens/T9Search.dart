import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme9/models/T9Models.dart';
import 'package:prokit_flutter/theme9/utils/T9Colors.dart';
import 'package:prokit_flutter/theme9/utils/T9Constant.dart';
import 'package:prokit_flutter/theme9/utils/T9DataGenerator.dart';
import 'package:prokit_flutter/theme9/utils/T9Extension.dart';
import 'package:prokit_flutter/theme9/utils/T9Strings.dart';
import 'package:prokit_flutter/theme9/utils/T9Widget.dart';

class T9Search extends StatefulWidget {
  static String tag = '/T9Search';

  @override
  T9SearchState createState() => T9SearchState();
}

class T9SearchState extends State<T9Search> {
  List<T9PeopleModel> mList1;
  List<T9PeopleModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = t9GetInstructor();
    mList2 = t9GetRecommended();
    print(mList1);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t9_layout_background);
    return Scaffold(
        backgroundColor: t9_layout_background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: boxDecoration(
                    showShadow: true, bgColor: t9_white, radius: 0),
                padding: EdgeInsets.fromLTRB(12, 16, 16, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.body1,
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.search,
                                color: t9_colorPrimary,
                                size: 20,
                              ),
                            ),
                          ),
                          TextSpan(
                              text: t9_hint_search,
                              style: TextStyle(
                                  fontSize: textSizeMedium,
                                  color: t9_textColorSecondary)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.body1,
                        children: [
                          TextSpan(
                              text: t9_lbl_filter,
                              style: TextStyle(
                                  fontSize: textSizeMedium,
                                  color: t9_colorPrimary)),
                          WidgetSpan(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.close,
                                color: t9_textColorSecondary,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: text(t9_lbl_top_instructors,
                    fontFamily: fontBold, fontSize: textSizeLargeMedium),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.4,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mList1.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return T9Instructor(mList1[index], index);
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: text(t9_lbl_recommended,
                    fontFamily: fontBold, fontSize: textSizeLargeMedium),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mList2.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return T9Recommended(mList2[index], index);
                    }),
              ),
            ],
          ),
        ));
  }
}

class T9Instructor extends StatelessWidget {
  T9PeopleModel model;

  T9Instructor(T9PeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(model.img),
                radius: w * 0.1,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          text(model.name, fontFamily: fontMedium),
          text(model.subject, textColor: t9_textColorSecondary),
        ],
      ),
    );
  }
}

class T9Recommended extends StatelessWidget {
  T9PeopleModel model;

  T9Recommended(T9PeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: CircleAvatar(
        radius: w * 0.1,
        backgroundImage: CachedNetworkImageProvider(model.img),
      ),
    );
  }
}
