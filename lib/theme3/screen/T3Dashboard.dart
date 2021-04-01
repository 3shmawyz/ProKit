import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/theme3/model/T3_Model.dart';
import 'package:prokit_flutter/theme3/utils/Extension.dart';
import 'package:prokit_flutter/theme3/utils/T3Constant.dart';
import 'package:prokit_flutter/theme3/utils/T3DataGenerator.dart';
import 'package:prokit_flutter/theme3/utils/T3Images.dart';
import 'package:prokit_flutter/theme3/utils/colors.dart';
import 'package:prokit_flutter/theme3/utils/strings.dart';
import 'package:prokit_flutter/theme3/utils/widgets.dart';

class T3Dashboard extends StatefulWidget {
  static var tag = "/T3Dashboard";

  @override
  State<StatefulWidget> createState() {
    return T3DashboardState();
  }
}

class T3DashboardState extends State<T3Dashboard> {
  List<T3DashboardSliderModel> mSliderListings;
  List<Theme3Dish> mListings;

  @override
  void initState() {
    super.initState();
    mSliderListings = getDashboardSlider();
    mListings = getDashboardList();
  }

  @override
  Widget build(BuildContext context) {
    double expandHeight = 80 + 30 + 195 + 30.0;
    changeStatusColor(Colors.transparent);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: expandHeight,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              pinned: true,
              titleSpacing: 0,
              backgroundColor: innerBoxIsScrolled ? t3_colorPrimary : t3_white,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              title: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Center(child: headerText(t3_lbl_dashboard))),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                            backgroundImage:
                                CachedNetworkImageProvider(t3_ic_profile),
                            radius: 16)),
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: t3_white,
                  height: expandHeight,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: (expandHeight - (195 * 0.5)) + 24,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                          t3_colorPrimary,
                          t3_colorPrimaryDark
                        ])),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 80),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: <Widget>[
                                  TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: t3_white,
                                      hintText: t3_lbl_search,
                                      contentPadding: EdgeInsets.only(
                                          left: 26.0,
                                          bottom: 8.0,
                                          top: 8.0,
                                          right: 50.0),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: t3_white, width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(26)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: t3_view_color, width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(26)),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: SvgPicture.asset(t3_ic_search,
                                            color: t3_colorPrimary)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 195,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mSliderListings.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return T3DashboardSlider(
                                    mSliderListings[index], index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    headingText(t3_lbl_food_recipe),
                    subHeadingText(t3_lbl_view_all)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mListings.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return T3DashboardList(mListings[index], index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class T3DashboardSlider extends StatelessWidget {
  T3DashboardSliderModel model;

  T3DashboardSlider(T3DashboardSliderModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285,
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 46.0),
            decoration: BoxDecoration(
              color: t3_white,
              shape: BoxShape.rectangle,
              boxShadow: <BoxShadow>[
                BoxShadow(color: shadow_color, blurRadius: 0.5, spreadRadius: 1)
              ],
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 55.0, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text(model.dishName,
                      textColor: t3_colorPrimary,
                      fontFamily: fontMedium,
                      maxLine: 2),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(model.dishType,
                          textColor: t3_green, fontSize: textSizeMedium),
                      Image.asset(t3_ic_spicy, height: 20, width: 20),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage:
                              CachedNetworkImageProvider(model.userImg),
                          radius: 20),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            text(model.userName,
                                textColor: t3_textColorPrimary),
                            text(model.type, fontSize: textSizeMedium),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: FractionalOffset.centerLeft,
            child: CachedNetworkImage(
              imageUrl: model.dishImg,
              height: 92.0,
              width: 92.0,
            ),
          )
        ],
      ),
    );
  }
}

class T3DashboardList extends StatelessWidget {
  Theme3Dish model;

  T3DashboardList(Theme3Dish model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
              child: Opacity(
                  opacity: 0.95,
                  child: CachedNetworkImage(
                    imageUrl: model.dishImage,
                  )),
              borderRadius: BorderRadius.circular(16)),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: text(model.dishName,
                                textColor: t3_white,
                                fontSize: textSizeLargeMedium,
                                fontFamily: fontMedium)),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: text(model.name,
                                textColor: t3_white,
                                fontSize: textSizeLargeMedium)),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.more_vert),
                        color: t3_white,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: IconButton(
              icon: Icon(Icons.play_circle_outline, size: 40),
              color: t3_white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
