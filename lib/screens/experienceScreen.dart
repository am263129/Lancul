import 'package:flutter/material.dart';
import 'package:lancul/UIview/PostView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../appTheme.dart';

class experienceScreen extends StatefulWidget {
  final AnimationController animationController;

  const experienceScreen({Key key, this.animationController}) : super(key: key);
  @override
  _experienceScreenState createState() => _experienceScreenState();
}

class _experienceScreenState extends State<experienceScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

  final _firestore = Firestore.instance;

  @override
  void initState() {
    super.initState();
    experiencesStream();
  }

  void experiencesStream() async {
    await for (var snapshot
        in _firestore.collection('experiences').snapshots()) {
      for (var experience in snapshot.documents) {
        print(experience.data);
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
      stream: _firestore.collection('experiences').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final restaurants = snapshot.data.documents;
          List<PostView> restaurantWidgets = [];
          for (var restaurant in restaurants) {
            final name = restaurant.data['name'];
            final rating = restaurant.data['rating'].toDouble();
            final imageUrl = restaurant.data['imageUrl'];
            final location = restaurant.data['location'];

            final guiderWidget = PostView(
              imageURL: '$imageUrl',
              name: '$name',
              location: '$location',
              rating: rating,
            );
            restaurantWidgets.add(guiderWidget);
          }
          return ListView(
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            children: restaurantWidgets,
          );
        }
      },
    );
  }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10, bottom: 10),
                          child: Text(
                            "Experiences",
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
