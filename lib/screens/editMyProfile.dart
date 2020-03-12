import 'package:lancul/UIview/flagBTN.dart';
import 'package:lancul/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:lancul/style/theme.dart' as Theme;

class EditMyProfileScreen extends StatefulWidget {
  @override
  _EditMyProfileScreenState createState() => _EditMyProfileScreenState();
}

class _EditMyProfileScreenState extends State<EditMyProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  String guideFlag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        color: AppTheme.nearlyWhite,
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 10,
                    right: 10),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage("assets/images/generic-user-purple.png"),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
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
            Container(
              margin: EdgeInsets.only(top: 10.0),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Theme.Colors.loginGradientStart,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 20.0,
                  ),
                  BoxShadow(
                    color: Theme.Colors.loginGradientEnd,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 20.0,
                  ),
                ],
                gradient: new LinearGradient(
                    colors: [
                      Theme.Colors.loginGradientEnd,
                      Theme.Colors.loginGradientStart
                    ],
                    begin: const FractionalOffset(0.2, 0.2),
                    end: const FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: MaterialButton(
                highlightColor: Colors.transparent,
                splashColor: Theme.Colors.loginGradientEnd,
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: "WorkSansBold"),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
