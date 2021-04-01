import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../T5BubbleBotoomBar.dart';
import '../T5Colors.dart';
import '../T5Images.dart';
import '../T5Strings.dart';

class T5BottomBar extends StatefulWidget {
  static String tag = '/T5BottomBar';

  @override
  T5BottomBarState createState() => T5BottomBarState();
}

class T5BottomBarState extends State<T5BottomBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: currentIndex,
      elevation: 8,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      //new
      hasNotch: false,
      //new
      hasInk: true,
      //new, gives a cute ink effect
      inkColor: t5ColorPrimaryLight,
      //optional, uses theme color if not specified
      items: <BubbleBottomBarItem>[
        tab(t5_img_home, t5_home),
        tab(t5_list_check, t5_lbl_listing),
        tab(t5_notification_2, t5_notification),
        tab(t5_user, t5_lbl_profile),
      ],
    );
  }
}
