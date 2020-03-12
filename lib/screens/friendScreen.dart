import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lancul/UIview/GuideProfileView.dart';
import 'package:lancul/screens/chat_screen.dart';
import 'package:lancul/UIview/flagBTN.dart';

import '../appTheme.dart';

class friendScreen extends StatefulWidget {
  final AnimationController animationController;

  const friendScreen({Key key, this.animationController}) : super(key: key);
  @override
  _friendScreenState createState() => _friendScreenState();
}

class _friendScreenState extends State<friendScreen>
    with TickerProviderStateMixin {
  final _firestore = Firestore.instance;

  @override
  void initState() {
    super.initState();
    guidersStream();
  }

  void guidersStream() async {
    await for (var snapshot in _firestore.collection('guiders').snapshots()) {
      for (var guider in snapshot.documents) {
        print(guider.data);
      }
    }
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('guiders').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final guiders = snapshot.data.documents;
          List<GuideProfileView> guiderWidgets = [];
          for (var guider in guiders) {
            final guiderName = guider.data['name'];
            final guiderBio = guider.data['bio'];
            final guiderVerified = guider.data['verified'];
            final guiderRating = guider.data['rating'].toDouble();
            final guiderImageUrl = guider.data['imageUrl'];
            final guiderLanguages = guider.data['languages'];

            final guiderWidget = GuideProfileView(
              imageURL: '$guiderImageUrl',
              username: '$guiderName',
              bio: '$guiderBio',
              rating: guiderRating,
              languages: '$guiderLanguages',
              chatScreen: ChatScreen(),
            );
            guiderWidgets.add(guiderWidget);
          }
          return ListView(
            padding: EdgeInsets.symmetric(vertical: 160),
            children: guiderWidgets,
          );
        }
      },
    );
  }

//جنس القائد
  String guideGender;
// علم القائد
  String guideFlag;

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget child) {
            return Container(
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppTheme.grey.withOpacity(0.4),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Friends",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28,
                                  letterSpacing: 1.2,
                                  color: AppTheme.darkerText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Container(
                          height: 50,
                          // لستت الاعلام التي يمكن سحبها
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0.0),
                            children: <Widget>[
                              //ازرار الاعلام
                              FlagBTN(
                                flagName: 'America',
                                guideFlag: guideFlag,
                                onPressed: () {
                                  //This is for America
                                  if (guideFlag == 'America') {
                                    guideFlag = null;
                                  } else {
                                    guideFlag = 'America';
                                  }
                                  print(guideFlag);
                                  setState(() {});
                                },
                              ),
                              FlagBTN(
                                flagName: 'Japan',
                                guideFlag: guideFlag,
                                onPressed: () {
                                  //This is for Japan
                                  if (guideFlag == 'Japan') {
                                    guideFlag = null;
                                  } else {
                                    guideFlag = 'Japan';
                                  }
                                  print(guideFlag);
                                  setState(() {});
                                },
                              ),
                              FlagBTN(
                                flagName: 'Saudi-Arabia',
                                guideFlag: guideFlag,
                                onPressed: () {
                                  //This is for Saudi-Arabia
                                  if (guideFlag == 'Saudi-Arabia') {
                                    guideFlag = null;
                                  } else {
                                    guideFlag = 'Saudi-Arabia';
                                  }
                                  print(guideFlag);
                                  setState(() {});
                                },
                              ),
                              FlagBTN(
                                flagName: 'Brazil',
                                guideFlag: guideFlag,
                                onPressed: () {
                                  //This is for Brazil
                                  if (guideFlag == 'Brazil') {
                                    guideFlag = null;
                                  } else {
                                    guideFlag = 'Brazil';
                                  }
                                  print(guideFlag);
                                  setState(() {});
                                },
                              ),
                              FlagBTN(
                                flagName: 'France',
                                guideFlag: guideFlag,
                                onPressed: () {
                                  //This is for France
                                  if (guideFlag == 'France') {
                                    guideFlag = null;
                                  } else {
                                    guideFlag = 'France';
                                  }
                                  print(guideFlag);
                                  setState(() {});
                                },
                              ),
                              FlagBTN(
                                flagName: 'Spain',
                                guideFlag: guideFlag,
                                onPressed: () {
                                  //This is for Spain
                                  if (guideFlag == 'Spain') {
                                    guideFlag = null;
                                  } else {
                                    guideFlag = 'Spain';
                                  }
                                  print(guideFlag);
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
