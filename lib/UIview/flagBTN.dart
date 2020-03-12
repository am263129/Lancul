import 'package:flutter/material.dart';

class FlagBTN extends FlatButton {
  const FlagBTN({
    Key key,
    @required this.flagName,
    @required this.guideFlag,
    @required VoidCallback onPressed,
  }) : super(key: key, onPressed: onPressed);

  final String flagName;
  final String guideFlag;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (onPressed),
      child: Container(
        margin: new EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: (guideFlag == flagName ? Colors.blue : Colors.black26),
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 0.0, // has the effect of extending the shadow
            )
          ],
        ),
        child: Center(
          child: Image.asset(
            'assets/images/flags/' + flagName + '.png',
          ),
        ),
      ),
    );
  }
}
