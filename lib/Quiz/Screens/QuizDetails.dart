import 'package:flutter/material.dart';
import 'package:prokit_flutter/Quiz/Screens/QuizCard.dart';
import 'package:prokit_flutter/Quiz/model/QuizModels.dart';
import 'package:prokit_flutter/Quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/Quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/Quiz/utils/QuizDataGenerator.dart';
import 'package:prokit_flutter/Quiz/utils/QuizExtension.dart';
import 'package:prokit_flutter/Quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/Quiz/utils/QuizWidget.dart';

class QuizDetails extends StatefulWidget {
  static String tag = '/QuizDetails';

  @override
  _QuizDetailsState createState() => _QuizDetailsState();
}

class _QuizDetailsState extends State<QuizDetails> {
  List<QuizTestModel> mList;

  @override
  void initState() {
    super.initState();
    mList = quizGetData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);
    return Scaffold(
      backgroundColor: quiz_app_background,
      body: Column(
        children: <Widget>[
          quizTopBar(quiz_lbl_biology_basics),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  text(quiz_lbl_biology_amp_scientific_method, isLongText: true, fontFamily: fontBold, isCentered: true, fontSize: textSizeXLarge),
                  text(quiz_text_4_to_8_lesson, textColor: quiz_textColorSecondary),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return quizList(mList[index], index);
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class quizList extends StatelessWidget {
  var width;
  QuizTestModel model;

  quizList(QuizTestModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16, bottom: 16, right: 16),
      decoration: boxDecoration(radius: 10, showShadow: true, bgColor: quiz_white),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: quiz_color_setting),
                width: width / 6.5,
                height: width / 6.5,
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  model.image,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.type, textColor: quiz_textColorSecondary, fontSize: textSizeSMedium),
                  text(
                    model.heading,
                    fontFamily: fontMedium,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          text(model.description, textColor: quiz_textColorSecondary),
          SizedBox(
            height: 16,
          ),
          quizButton(
              textContent: quiz_lbl_begin,
              onPressed: () {
                launchScreen(context, QuizCards.tag);
              })
        ],
      ),
    );
  }
}
