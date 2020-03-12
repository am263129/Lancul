import 'package:lancul/main.dart';
import 'package:flutter/material.dart';
import '../appTheme.dart';

class MenuItemView extends StatelessWidget {
  final String titleTxt;
  final Icon menuIcon;
  final LinearGradient backgroundGradient;
  final Widget navigateScreen;
  final AnimationController animationController;
  final Animation animation;

  const MenuItemView(
      {Key key,
      this.titleTxt,
      this.menuIcon,
      this.backgroundGradient,
      @required this.navigateScreen,
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(colors: [
      AppTheme.gradientStart,
      AppTheme.gradientEnd,
    ]).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 10, bottom: 3),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => navigateScreen),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: backgroundGradient,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      child: menuIcon,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      titleTxt,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 22,
                                        letterSpacing: 0.0,
                                        foreground: Paint()
                                          ..shader = linearGradient,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
