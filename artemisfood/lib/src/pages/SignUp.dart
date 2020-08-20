import 'package:artemisfood/src/components/RoundedButton.dart';
import 'package:artemisfood/src/widgets/custom_password_field.dart';
import 'package:artemisfood/src/widgets/custom_text_field.dart';
import 'package:artemisfood/src/widgets/row_text_button.dart';
import 'package:artemisfood/src/widgets/top_background.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

bool isVisible = false;

class _SignUpState extends State<SignUp> {
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
              Text('Create Account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.black),),
              SizedBox(height: 5.0),
              Text('Sign up to continue', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0, color: Colors.grey),),
              _separator,
              CustomTextField(
                onChanged: (value) {

                },
              ),
              _separator,
              CustomPasswordField(
                onChanged: (value) {

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
                   hintText: 'Sign Up',
                   onPress: () {},
                 ),
               ),
               const SizedBox(height: 20.0),
               CustomRowTextWithButton(
                 text: 'Already have an account? ',
                 buttonText: 'Login',
                 onTap: () {
                  Navigator.pushNamed(context, 'login');
                },
               ),
            ],
          ),
        ),
      ),
    );
  }
}