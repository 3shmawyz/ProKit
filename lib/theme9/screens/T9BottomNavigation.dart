import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme9/utils/T9BottomNavigationBar.dart';
import 'package:prokit_flutter/theme9/utils/T9Colors.dart';
import 'package:prokit_flutter/theme9/utils/T9Extension.dart';
import 'package:prokit_flutter/theme9/utils/T9Images.dart';

class T9BottomNavigation extends StatefulWidget {
  static String tag = '/T9BottomNavigation';

  @override
  T9BottomNavigationState createState() => T9BottomNavigationState();
}

class T9BottomNavigationState extends State<T9BottomNavigation> {
  var _selectedIndex = 0;

  @override
  void initState() {
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
    changeStatusColor(t9_layout_background);
    return Scaffold(
      backgroundColor: t9_layout_background,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: t9_ShadowColor, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5)]),
        child: T9BottomNavigationBar(
          items: const <T9BottomNavigationBarItem>[
            T9BottomNavigationBarItem(
              icon: t9_ic_home_navigation,
            ),
            T9BottomNavigationBarItem(
              icon: t9_ic_search_navigation,
            ),
            T9BottomNavigationBarItem(
              icon: t9_ic_chart_navigation,
            ),
            T9BottomNavigationBarItem(
              icon: t9_ic_message_navigation,
            ),
            T9BottomNavigationBarItem(
              icon: t9_ic_more_navigation,
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: t9_textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: t9_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: T9BottomNavigationBarType.fixed,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 8),
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: t9_colorPrimary,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
