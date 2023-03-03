import 'package:cra_complaints/Components/loginTextField.dart';
import 'package:cra_complaints/Components/my_button.dart';
import 'package:cra_complaints/Components/registerTextFields.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: const [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Fname(),
                  SizedBox(
                    height: 10,
                  ),
                  Lname(),
                  SizedBox(
                    height: 10,
                  ),
                  EmailField(),
                  SizedBox(
                    height: 10,
                  ),
                  PassField(),
                  SizedBox(
                    height: 20,
                  ),
                  SignUpButton(),
                ],
              )),
        ));
  }
}
