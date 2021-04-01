import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class MWBottomNavigationScreen3 extends StatefulWidget {
  static String tag = '/MWBottomNavigationScreen3';

  @override
  MWBottomNavigationScreenState createState() => MWBottomNavigationScreenState();
}

class MWBottomNavigationScreenState extends State<MWBottomNavigationScreen3> {
  int currentIndex3 = 0;

  final example3 = [
    Text('Example 3', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Reels', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('New Photo', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Activity', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Profile', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
  ];

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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        width: context.width(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            example3.elementAt(currentIndex3),
            15.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bulletText('This example consists of only icons and label but only the selected item shows the label.'),
                5.height,
                bulletText('This example consists of only icons and label but only the selected item shows the label.'),
                5.height,
                bulletText('Bottom Navigation type is shifting.'),
                5.height,
                bulletText('Use when there are less than five items.'),
              ],
            ),
            /*UL(
              children: [
                Text('This example consists of only icons and label but only the selected item shows the label.', style: primaryTextStyle()),
                Text('This example consists of only icons and label but only the selected item shows the label.', style: primaryTextStyle()),
                Text('Bottom Navigation type is shifting.', style: primaryTextStyle()),
                Text('Use when there are less than five items.', style: primaryTextStyle()),
              ],
            ),*/
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentIndex3 = index;
          });
        },
        currentIndex: currentIndex3,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: appStore.iconColor,
        unselectedItemColor: appStore.textSecondaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: appStore.appBarColor,
        items: [
          //1
          BottomNavigationBarItem(
            icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/home.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/home_fill.png', height: 25, width: 25, color: appStore.iconColor),
            title: Text('Home'),
            backgroundColor: appStore.appBarColor,
          ),
          //2
          BottomNavigationBarItem(
            icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/reel.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/reel_fill.png', height: 25, width: 25, color: appStore.iconColor),
            title: Text('Reels'),
          ),
          //3
          BottomNavigationBarItem(
            icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/gallery.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/gallery_fill.png', height: 25, width: 25, color: appStore.iconColor),
            title: Text('Gallery'),
          ),
          //4
          BottomNavigationBarItem(
            icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/heart.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/heart_fill.png', height: 25, width: 25, color: appStore.iconColor),
            title: Text('Activity'),
          ),
          //5
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: appStore.iconSecondaryColor, width: 1)),
              child: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/profile1.png', height: 30, width: 30).cornerRadiusWithClipRRect(20),
            ),
            activeIcon: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: appStore.iconColor, width: 1)),
              child: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/profile1.png', height: 30, width: 30).cornerRadiusWithClipRRect(20),
            ),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}

Widget bulletText(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("•  ", style: TextStyle(color: appStore.textPrimaryColor, fontSize: 14)),
      Text(text, style: TextStyle(color: appStore.textPrimaryColor, fontSize: 14)).expand(),
    ],
  );
}
