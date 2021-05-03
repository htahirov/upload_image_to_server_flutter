import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_upload_flutter/extracts.dart';
import 'package:image_upload_flutter/screens/main_screen.dart';
import 'package:image_upload_flutter/screens/register_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailorusernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var data;
  Future getData() async {
    if (emailorusernameController.text.toString().contains('@gmail.com')) {
      data = {
        'email': emailorusernameController.text,
        'password': passwordController.text,
      };
    } else {
      data = {
        'username': emailorusernameController.text,
        'password': passwordController.text,
      };
    }

    String uploadurl = "${URL.url}login.php";
    Uri url = Uri.parse(uploadurl);
    var response = await http.post(url, body: data);
    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (body['success'] == 1) {
        //String username = emailController.text;
        String username = body['description']['username'];
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MainScreen(
                      getUsername: username,
                    )));

        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('username', username);
      } else {
        print('Error!');
      }
    } else {
      print('Response Error!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
            child: Column(
              children: [
                SignContainer(
                    controller: emailorusernameController,
                    bool: false,
                    label: 'Email'),
                SignContainer(
                    controller: passwordController,
                    bool: true,
                    label: 'Password'),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Builder(
                    builder: (context) => ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xFF8D33B6),
                        child: Text('Login'),
                        onPressed: () {
                          //setString();
                          getData();
                        },
                      ),
                    ),
                  ),
                ),
                LoginRegisterButton(
                  accountText: "Don't have an account?",
                  textButton: 'Register',
                  onClick: () =>
                      Navigator.pushNamed(context, RegisterScreen.id),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
