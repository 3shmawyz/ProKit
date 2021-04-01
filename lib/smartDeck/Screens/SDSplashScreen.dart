import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDStyle.dart';
import 'package:prokit_flutter/smartDeck/Screens/SDWalkThroughScreen.dart';

class SDSplashScreen extends StatefulWidget {
  static String tag = '/SDSplashScreen';

  @override
  _SDSplashScreenState createState() => _SDSplashScreenState();
}

class _SDSplashScreenState extends State<SDSplashScreen>
    with SingleTickerProviderStateMixin {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationPage() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SDWalkThroughScreen(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF076ACF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              'images/smartDeck/images/sdlogo.png',
              height: 105,
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Smartdeck",
                style: secondaryTextStyle(
                  size: 25,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
