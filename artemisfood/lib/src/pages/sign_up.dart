import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/components/RowTxtButton.dart';
import 'package:artemisfood/src/components/TextFieldContainer.dart';
import 'package:artemisfood/src/components/background.dart';
import 'package:artemisfood/src/components/rounded_input_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                    'Create Account',
                    style: TextStyle( fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.bold ) //Son el valor de las propiedades de la clase
                  ),
                  Text(
                    'Sign up to continue',
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
                  SizedBox(
                    height: 25.0,
                  ),
                  RoundedButton(
                    hintText: 'Sign up',
                    onPress: () {},
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  RowTxtButton(
                    hintText: 'Already have an account?',
                    hintTextButton: 'Login',
                    onPress: () {
                      Navigator.pushNamed(
                        context, 'login'
                      );
                    }, //dejo de compartir
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}