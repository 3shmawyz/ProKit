import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme4/utils/T4Colors.dart';
import 'package:prokit_flutter/theme4/utils/T4Extension.dart';
import 'package:prokit_flutter/theme4/utils/T4Images.dart';
import 'package:prokit_flutter/theme4/utils/T4Widgets.dart';
import 'package:prokit_flutter/theme4/utils/widgets/T4BottomNavigationBar.dart';

class T4BottomNavigation extends StatefulWidget {
  static var tag = "/T4BottomNavigation";

  @override
  T4BottomNavigationState createState() => T4BottomNavigationState();
}

class T4BottomNavigationState extends State<T4BottomNavigation> {
  var _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t4_app_background);

    return Scaffold(
      backgroundColor: t4_app_background,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: t4_shadow_color, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5)]),
        child: T4BottomNavigationBar(
          items: const <T4BottomNavigationBarItem>[
            T4BottomNavigationBarItem(
              icon: t4_home,
            ),
            T4BottomNavigationBarItem(
              icon: t4_playbutton,
            ),
            T4BottomNavigationBarItem(
              icon: t4_heart,
            ),
            T4BottomNavigationBarItem(
              icon: t4_user,
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: t4_textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: t4_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: T4BottomNavigationBarType.fixed,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: 180,
            alignment: Alignment.center,
            child: ring(" Welcome to Bottom\nNavigation Bar"),
          ),
          TopBar("Bottom Navigation")
        ],
      ),
    );
  }
}
