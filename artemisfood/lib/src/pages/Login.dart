import 'dart:convert';
import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:artemisfood/src/widgets/custom_password_field.dart';
import 'package:artemisfood/src/widgets/custom_text_field.dart';
import 'package:artemisfood/src/widgets/row_text_button.dart';
import 'package:artemisfood/src/widgets/top_background.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

bool isVisible = false;
String username;
String password;

class _LoginState extends State<Login> {
  @override 
  Widget build(BuildContext context) {
    final _separator = const  SizedBox(height: 30.0);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TopBackground(),
              Text('Welcome', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.black),),
              SizedBox(height: 5.0),
              Text('Login to continue', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0, color: Colors.grey),),
              _separator,
              CustomTextField(
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              _separator,
              CustomPasswordField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                onPressed: () {
                  isVisible = !isVisible;
                },
                isVisible: isVisible,
              ),
               _separator,
               FractionallySizedBox(
                 widthFactor: .6,
                 child: RoundedButton(
                   hintText: 'Login',
                   onPress: () => signIn(username,password,context),
                 ),
               ),
               TextButton(
                 hintText: 'Forgot password?',
                 fontWeight: FontWeight.w500,
               ),
               const SizedBox(height: 20.0),
               CustomRowTextWithButton(
                 onTap: () {
                  Navigator.pushNamed(context, 'Sign_up');
                },
               ),
            ],
          ),
        ),
      ),
    );
  }
}

signIn(String username, String password, BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Map data = {
    'usuario': username,
    'password': password
  };
  Map jsonResponse;
  http.Response response = await http.post('$server/login', body: data);
  jsonResponse = json.decode(response.body);
  sharedPreferences.setString("token", jsonResponse['token']);
  Navigator.popAndPushNamed(context, 'Home');
}







