import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDStyle.dart';
import 'package:prokit_flutter/smartDeck/Screens/SDForgotPwdScreen.dart';
import 'package:prokit_flutter/smartDeck/Screens/SDHomePageScreen.dart';
import 'package:prokit_flutter/smartDeck/Screens/SDRegisterScreen.dart';

class SDLoginScreen extends StatefulWidget {
  @override
  _SDLoginScreenState createState() => _SDLoginScreenState();
}

class _SDLoginScreenState extends State<SDLoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    changeStatusColor(sdAppBackground);
    return SafeArea(
      child: Scaffold(
        backgroundColor: sdAppBackground,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Easy to learn \nanywhere and anytime',
                    style: boldTextStyle(size: 25),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Sign in to your account',
                    style: secondaryTextStyle(size: 16),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: size.width,
                    decoration: boxDecorations(
                      showShadow: true,
                    ),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          cursorColor: sdTextSecondaryColor.withOpacity(0.2),
                          cursorWidth: 1,
                          autocorrect: true,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Username or Mobile number',
                            hintStyle: secondaryTextStyle(
                                textColor:
                                    sdTextSecondaryColor.withOpacity(0.6)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 16, bottom: 16, top: 16, right: 16),
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                obscureText: true,
                                cursorColor:
                                    sdTextSecondaryColor.withOpacity(0.2),
                                cursorWidth: 1,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: secondaryTextStyle(
                                    textColor:
                                        sdTextSecondaryColor.withOpacity(0.6),
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 16, bottom: 16, top: 16, right: 16),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SDForgotPwdScreen(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text(
                                  'Forgot?',
                                  style: boldTextStyle(
                                      size: 14, textColor: sdPrimaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  SDButton(
                    textContent: "SIGN IN",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SDHomePageScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
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
                  'Don\'t have an account?',
                  style: secondaryTextStyle(),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => sdRegisterScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'REGISTER',
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
