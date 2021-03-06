import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/components/RowTxtButton.dart';
import 'package:artemisfood/src/components/TextButton.dart';
import 'package:artemisfood/src/components/TextFieldContainer.dart';
import 'package:artemisfood/src/components/background.dart';
import 'package:artemisfood/src/components/rounded_input_field.dart';
import 'package:artemisfood/src/static/const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String username;
  String password;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child: Background(
            child: Container(
              margin: EdgeInsets.only(bottom: 40.0),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end, //Osea mientras voy añadiendo más cosas se va subiendo
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: TextStyle( fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.bold ) //Son el valor de las propiedades de la clase
                  ),
                  Text(
                    'Login to continue',
                  ),
                  TextFieldContainer(
                    child: RoundedInputField(
                      hintText: 'Username',
                      icon: Icons.person,
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                    ),
                  ),
                  TextFieldContainer(
                    child: RoundedInputField(
                      hintText: 'Password',
                      passtype: true,
                      icon: Icons.vpn_key,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RoundedButton(
                    hintText: 'Login',
                    onPress: () => signIn(username,password,context),
                  ),
                  TextButton(
                    hintText: 'Forgot Password?',
                    onPress: () {},
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  RowTxtButton(
                    hintText: 'New User?',
                    hintTextButton: 'Sign Up',//Si es no? es un botonsito
                    onPress: () {
                      Navigator.pushNamed(
                        context, 'Sign_up'
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
} //Namas voy a hacer que pueda pasar a la pagina pulsando el boton, ya despues lo copio

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