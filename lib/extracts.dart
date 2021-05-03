import 'package:flutter/material.dart';

class URL {
  static const String url = "http://192.168.0.103/my_projects/";
}

class SignContainer extends StatelessWidget {
  SignContainer({@required this.controller, this.label, this.bool});

  final TextEditingController controller;
  final String label;
  final bool;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        obscureText: bool,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          labelStyle: TextStyle(color: Color(0xFF8D33B6)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF8D33B6)),
          ),
        ),
      ),
    );
  }
}

class LoginRegisterButton extends StatelessWidget {
  LoginRegisterButton({this.accountText, this.textButton, this.onClick});

  final String accountText;
  final String textButton;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            accountText,
            style: TextStyle(
              color: Color(0xFF8D33B6),
            ),
          ),
          FlatButton(
            textColor: Color(0xFF8D33B6),
            child: Text(
              textButton,
              style: TextStyle(fontSize: 20),
            ),
            onPressed: onClick,
          ),
        ],
      ),
    );
  }
}
