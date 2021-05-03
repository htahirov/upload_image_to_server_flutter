import 'package:flutter/material.dart';
import 'package:image_upload_flutter/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  static const String id = 'account_screen';

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Future logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        backgroundColor: Color(0xFF8D33B6),
      ),
      body: Center(
        child: RaisedButton(
          color: Color(0xFF8D33B6),
          colorBrightness: Brightness.dark,
          onPressed: () {
            logOut();
            Navigator.pushNamed(context, LoginScreen.id);
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
