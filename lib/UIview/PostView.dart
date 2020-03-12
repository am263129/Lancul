import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../appTheme.dart';

class PostView extends StatelessWidget {
  final VoidCallback callback;
  final String imageURL;
  final String name;
  final String location;
  final double rating;

  const PostView(
      {Key key,
      this.imageURL = '',
      this.name = '',
      this.location = '',
      this.rating = 0.0,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(colors: [
      AppTheme.gradientStart,
      AppTheme.gradientEnd,
    ]).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          callback();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: Offset(4, 4),
                blurRadius: 16,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2,
                      child: Image.network(
                        imageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: AppTheme.nearlyWhite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 8, bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      name,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          foreground: Paint()
                                            ..shader = linearGradient),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.mapMarkerAlt,
                                          size: 12,
                                          color: AppTheme.nearlyBlack,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          location,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Colors.grey.withOpacity(0.8)),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Row(
                                        children: <Widget>[
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              return RadialGradient(
                                                center: Alignment.centerRight,
                                                radius: 1.0,
                                                colors: <Color>[
                                                  AppTheme.gradientStart,
                                                  AppTheme.gradientEnd,
                                                ],
                                                tileMode: TileMode.mirror,
                                              ).createShader(bounds);
                                            },
                                            child: SmoothStarRating(
                                              allowHalfRating: true,
                                              starCount: 5,
                                              rating: rating,
                                              size: 20,
                                              color: AppTheme.gradientStart,
                                              borderColor:
                                                  AppTheme.gradientStart,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32.0),
                      ),
                      onTap: () {},
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return RadialGradient(
                                center: Alignment.centerRight,
                                radius: 1.0,
                                colors: <Color>[
                                  AppTheme.gradientStart,
                                  AppTheme.gradientEnd,
                                ],
                                tileMode: TileMode.mirror,
                              ).createShader(bounds);
                            },
                            child: Icon(
                              Icons.favorite_border,
                            ),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
