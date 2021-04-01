import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

import '../../../main.dart';
import '../../../main/utils/AppWidget.dart';

class CWTabBarScreen2 extends StatefulWidget {
  static const tag = '/CWTabBarScreen2';

  @override
  CWTabBarScreen2State createState() => CWTabBarScreen2State();
}

class CWTabBarScreen2State extends State<CWTabBarScreen2> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget mPage(var value) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              value,
              style: boldTextStyle(),
            )),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 16),
              child: Text(
                lipsum.createParagraph(numSentences: 2),
                style: secondaryTextStyle(),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'TabBar with Label & Icon'),
        body: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              backgroundColor: appStore.appBarColor,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  title: Text('Favourite'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  title: Text('Cart'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ],
              activeColor: appColorPrimary,
              inactiveColor: Colors.grey,
            ),
            tabBuilder: (BuildContext context, int index) {
              switch (index) {
                case 0:
                  return mPage("Home");
                  break;
                case 1:
                  return mPage("Favourite");
                  break;
                case 2:
                  return mPage("Cart");
                  break;
                default:
                  return mPage("Profile");
                  break;
              }
            }),
      ),
    );
  }
}
