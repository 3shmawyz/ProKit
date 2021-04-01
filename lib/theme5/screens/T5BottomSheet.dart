import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prokit_flutter/theme5/model/T5Models.dart';
import 'package:prokit_flutter/theme5/utils/T5Colors.dart';
import 'package:prokit_flutter/theme5/utils/T5DataGenerator.dart';
import 'package:prokit_flutter/theme5/utils/T5Extension.dart';
import 'package:prokit_flutter/theme5/utils/T5Strings.dart';
import 'package:prokit_flutter/theme5/utils/T5Widget.dart';
import 'package:prokit_flutter/theme5/utils/widgets/T5GridListing.dart';

class T5BottomSheet extends StatefulWidget {
  static var tag = "/T5BottomSheet";

  @override
  T5BottomSheetState createState() => T5BottomSheetState();
}

class T5BottomSheetState extends State<T5BottomSheet> {
  GlobalKey<ScaffoldState> _scaffoldKey = null;
  List<T5Category> mFavouriteList;

  @override
  void initState() {
    super.initState();
    mFavouriteList = getBottomSheetItems();
  }

  showSheet(BuildContext aContext) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: aContext,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 0.65,
              maxChildSize: 1,
              minChildSize: 0.5,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: EdgeInsets.only(top: 24),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(color: t5LayoutBackgroundWhite, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: t5ViewColor,
                        width: 50,
                        height: 3,
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: T5GridListing(mFavouriteList, true),
                        ),
                      )
                    ],
                  ),
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t5White);
    _scaffoldKey = new GlobalKey<ScaffoldState>();
    Future.delayed(const Duration(milliseconds: 1000), () {
      showSheet(context);
    });
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          TopBar(),
          Container(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () {
                    showSheet(context);
                  },
                  child: ring(t5_lbl_welcome_to_bottom_sheet)))
        ],
      ),
    );
  }
}
