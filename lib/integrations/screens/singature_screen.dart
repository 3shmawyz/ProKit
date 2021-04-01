import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/integrations/utils/common.dart';
import 'package:prokit_flutter/integrations/utils/styles.dart';
import 'package:signature/signature.dart';

class SignatureScreen extends StatefulWidget {
  static String tag = '/SignatureScreen';

  @override
  SignatureScreenState createState() => SignatureScreenState();
}

class SignatureScreenState extends State<SignatureScreen> {
  final SignatureController controller =
      SignatureController(penStrokeWidth: 5, penColor: Colors.red);

  @override
  Widget build(BuildContext context) {
    changeStatusColor(primaryColor);

    return Scaffold(
      appBar: getAppBar(context, "Signature Pad"),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Signature(
                controller: controller,
                height: MediaQuery.of(context).size.height,
                backgroundColor: Colors.white10),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: MaterialButton(
                padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                color: primaryColor,
                onPressed: () {
                  setState(() {
                    controller.clear();
                  });
                },
                child: text('Clear Signature', textColor: whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
