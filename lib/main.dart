import 'package:flutter/material.dart';
import 'package:lancul/appHomeScreen.dart';
import 'package:lancul/screens/login_screen.dart';
import 'package:lancul/screens/chat_screen.dart';

void main() => runApp(lancul());

class lancul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: AppHomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        AppHomeScreen.id: (context) => AppHomeScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
