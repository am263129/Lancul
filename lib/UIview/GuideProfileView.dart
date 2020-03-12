import 'package:lancul/designCourse/designCourseAppTheme.dart';
import 'package:lancul/main.dart';
import 'package:flutter/material.dart';

class GuideProfileView extends StatelessWidget {
  String username;
  String bio;
  String languages;
  double rating;
  String imageURL;
  final Widget chatScreen;

  GuideProfileView(
      {Key key,
      this.username = '',
      this.imageURL = '',
      this.bio = '',
      this.languages = '',
      this.rating = 0.0,
      @required this.chatScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => chatScreen),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          height: 130,
          child: Stack(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: Container(
                        decoration: new BoxDecoration(
                          color: HexColor('#F8FAFB'),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, left: 35),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          username,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            letterSpacing: 0.27,
                                            color:
                                                DesignCourseAppTheme.darkerText,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Icon(
                                            Icons.verified_user,
                                            color:
                                                DesignCourseAppTheme.nearlyBlue,
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16, left: 35),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 220,
                                          height: 50,
                                          child: Text(
                                            bio,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              fontSize: 13,
                                              letterSpacing: 0.27,
                                              color: DesignCourseAppTheme.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5, top: 10, right: 20),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            languages,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              letterSpacing: 0.27,
                                              color: DesignCourseAppTheme
                                                  .nearlyBlue,
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  "${rating}",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 18,
                                                    letterSpacing: 0.27,
                                                    color: DesignCourseAppTheme
                                                        .grey,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: DesignCourseAppTheme
                                                      .nearlyBlue,
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Container(
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30, left: 16),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                        child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Container(
                              color: Colors.white,
                              child: Image.network(imageURL),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
