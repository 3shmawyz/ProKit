import 'package:flutter/material.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDStyle.dart';

class SDSettingScreen extends StatefulWidget {
  @override
  _SDSettingScreenState createState() => _SDSettingScreenState();
}

class _SDSettingScreenState extends State<SDSettingScreen> {
  @override
  Widget build(BuildContext context) {
    Widget mOption(var icon, var heading) {
      return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: sdIconColor,
                  size: 18,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  heading,
                  style:
                      primaryTextStyle(size: 16, textColor: sdTextPrimaryColor),
                ),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: sdIconColor,
            )
          ],
        ),
      );
    }

    Widget mDivider() {
      return Container(
        color: sdViewColor,
//        margin: EdgeInsets.only(bottom: 10),
        height: 1,
      );
    }

    changeStatusColor(sdAppBackground);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text('Settings', style: boldTextStyle(size: 20)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: <Widget>[
            mOption(Icons.language, "Preferences"),
            mDivider(),
            mOption(Icons.lock_outline, "Privacy and Security"),
            mDivider(),
            mOption(Icons.notifications_none, "Notification Settings"),
            mDivider(),
            mOption(Icons.help_outline, "Help Center"),
            mDivider(),
            mOption(Icons.launch, "Logout"),
          ],
        ),
      ),
    );
  }
}
