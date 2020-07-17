//Mi chat : perdón me buggee xdddd
import 'package:artemisfood/src/components/TextFieldContainer.dart';
import 'package:artemisfood/src/components/background.dart';
import 'package:artemisfood/src/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(Login());

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF4527A0),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        //Pinches snippets
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
                      onChanged: (value) {},
                    ),
                  ),
                  TextFieldContainer(
                    child: RoundedInputField(
                      hintText: 'Password',
                      icon: Icons.vpn_key,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}