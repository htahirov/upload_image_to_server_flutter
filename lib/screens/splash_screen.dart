import 'package:flutter/material.dart';
import 'package:image_upload_flutter/screens/login_screen.dart';
import 'package:image_upload_flutter/screens/main_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String getUsername;

  @override
  void initState() {
    super.initState();
    getString();
  }

  Future getString() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      getUsername = sharedPreferences.getString('username');
    });
    print(getUsername);
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: getUsername == null
          ? LoginScreen()
          : MainScreen(getUsername: getUsername),
      backgroundColor: Color(0xFF8D33B6),
      title: new Text(
        'Instagram',
        style: TextStyle(color: Colors.white),
        textScaleFactor: 2.2,
      ),
      loadingText: Text(
        "Loading",
        style: TextStyle(color: Colors.white),
      ),
      loaderColor: Colors.white,
    );
  }
}
