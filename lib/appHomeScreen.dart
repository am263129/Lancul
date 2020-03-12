import 'package:lancul/model/tabIconData.dart';
import 'package:lancul/screens/experienceScreen.dart';
import 'package:lancul/screens/restaurantsScreen.dart';
import 'package:lancul/screens/friendScreen.dart';
import 'package:lancul/screens/bookScreen.dart';
import 'package:lancul/screens/myProfileScreen.dart';
import 'package:lancul/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'bottomNavigationView/bottomBarView.dart';
import 'appTheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/User.dart';

class AppHomeScreen extends StatefulWidget {
  static String id = 'appHomeScreen';

  @override
  _AppHomeScreenState createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  Widget tabBody = Container(
    color: AppTheme.background,
  );

  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    tabIconsList.forEach((tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    tabBody = BookScreen(animationController: animationController);
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        User.email = user.email;
        User.uid = user.uid;
        final userData =
            await _firestore.collection('users').document(user.uid).get();
        print(userData.data);
      } else {
        Navigator.pushNamed(context, LoginScreen.id);
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
            tabIconsList: tabIconsList,
            flagClick: () {
              print('flag Btn is clicked');
            },
            changeIndex: (index) {
              if (index == 0) {
                animationController.reverse().then((data) {
                  if (!mounted) return;
                  setState(() {
                    tabBody =
                        BookScreen(animationController: animationController);
                  });
                });
              } else if (index == 1) {
                animationController.reverse().then((data) {
                  if (!mounted) return;
                  setState(() {
                    tabBody = experienceScreen(
                        animationController: animationController);
                  });
                });
              } else if (index == 2) {
                animationController.reverse().then((data) {
                  if (!mounted) return;
                  setState(() {
                    tabBody = restaurantsScreen(
                        animationController: animationController);
                  });
                });
              } else if (index == 3) {
                animationController.reverse().then((data) {
                  if (!mounted) return;
                  setState(() {
                    tabBody = myProfileScreen(
                        animationController: animationController);
                  });
                });
              } else if (index == 4) {
                animationController.reverse().then((data) {
                  if (!mounted) return;
                  setState(() {
                    tabBody =
                        friendScreen(animationController: animationController);
                  });
                });
              }
            }),
      ],
    );
  }
}
