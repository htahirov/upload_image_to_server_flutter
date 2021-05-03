import 'package:flutter/material.dart';
import 'package:image_upload_flutter/screens/account_screen.dart';
import 'package:image_upload_flutter/screens/login_screen.dart';
import 'package:image_upload_flutter/screens/main_screen.dart';
import 'package:image_upload_flutter/screens/register_screen.dart';
import 'package:image_upload_flutter/screens/splash_screen.dart';
import 'package:image_upload_flutter/screens/upload_image_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashPage.id,
      routes: {
        SplashPage.id: (context) => SplashPage(),
        RegisterScreen.id: (context) => RegisterScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        MainScreen.id: (context) => MainScreen(),
        ImageUpload.id: (context) => ImageUpload(),
        AccountScreen.id: (context) => AccountScreen(),
      },
    );
  }
}
