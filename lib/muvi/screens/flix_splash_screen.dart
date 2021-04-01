import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/muvi/screens/flix_onboarding_screen.dart';
import 'package:prokit_flutter/muvi/utils/flix_widget_extensions.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_images.dart';

class MuviSplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';

  @override
  MuviSplashScreenState createState() => MuviSplashScreenState();
}

class MuviSplashScreenState extends State<MuviSplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    finish(context);
    launchScreen(context, MuviOnBoardingScreen.tag);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: muvi_navigationBackground,
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(ic_logo, width: MediaQuery.of(context).size.width * 0.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
