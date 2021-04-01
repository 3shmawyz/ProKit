import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:prokit_flutter/orapay/utils/Style.dart';

import 'op_walk_through.dart';


class OPSplashScreen extends StatefulWidget {
  static String tag = '/OPSplashScreen';

  @override
  _OPSplashScreenState createState() => _OPSplashScreenState();
}

class _OPSplashScreenState extends State<OPSplashScreen>
    with SingleTickerProviderStateMixin {

  startTime() async {
    var _duration = Duration(seconds: 2);
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
        builder: (context) => OPWalkThroughScreen(),
      ),
    );
  }

  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

        return Scaffold(
          body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Image.asset('images/orapay/opsplash.png',
                        width: 75, height: 75, fit: BoxFit.fill),
                    SizedBox(height : 10),
                    Text("OraPay", style: boldTextStyle(size: 20)),
                  ],
                ),
              ),
            ),
          ),
        );

  }
}
