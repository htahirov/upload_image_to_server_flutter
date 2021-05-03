import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_upload_flutter/extracts.dart';
import 'package:image_upload_flutter/screens/login_screen.dart';
import 'package:image_upload_flutter/screens/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future getData() async {
    var data = {
      'email': emailController.text,
      'username': usernameController.text,
      'password': passwordController.text,
    };

    String uploadurl = "${URL.url}register.php";
    Uri url = Uri.parse(uploadurl);
    var response = await http.post(url, body: data);
    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (body['success'] == 1) {
        String username = body['description']['username'];
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MainScreen(
                      getUsername: username,
                    )));
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SignContainer(
                    controller: emailController, bool: false, label: 'Email'),
                SignContainer(
                    controller: usernameController,
                    bool: false,
                    label: 'Username'),
                SignContainer(
                    controller: passwordController,
                    bool: true,
                    label: 'Password'),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Builder(
                    builder: (context) => RaisedButton(
                      textColor: Colors.white,
                      color: Color(0xFF8D33B6),
                      child: Text('Register'),
                      onPressed: () {
                        getData();
                      },
                    ),
                  ),
                ),
                LoginRegisterButton(
                  accountText: 'Already have an account?',
                  textButton: 'Login',
                  onClick: () => Navigator.pushNamed(context, LoginScreen.id),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
