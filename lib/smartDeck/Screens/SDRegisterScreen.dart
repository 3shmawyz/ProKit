import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDStyle.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/codePicker/country_code_picker.dart';
import 'package:prokit_flutter/smartDeck/Screens/SDVerificationScreen.dart';

class sdRegisterScreen extends StatefulWidget {
  @override
  _sdRegisterScreenState createState() => _sdRegisterScreenState();
}

class _sdRegisterScreenState extends State<sdRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 100,
              left: 25,
              right: 25,
            ),
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'New Account',
                  style: boldTextStyle(size: 25),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Create new account to get access to our course by entering your mobile number',
                  style: secondaryTextStyle(
                      size: 16,
                      textColor: sdTextSecondaryColor.withOpacity(0.7)),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  decoration: boxDecorations(
                    radius: 5,
                    showShadow: true,
                  ),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CountryCodePicker(
                        onChanged: print,
                        padding: EdgeInsets.all(0),
                        showFlag: true,
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: sdViewColor,
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone Number",
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 85,
                ),
                SDButton(
                  textContent: "CONTINUE",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SDVerficationScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        persistentFooterButtons: <Widget>[
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 15, right: 15),
            width: MediaQuery.of(context).copyWith().size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Already have an account?',
                  style: secondaryTextStyle(),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'SIGN IN',
                    style: boldTextStyle(size: 14, textColor: sdPrimaryColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
