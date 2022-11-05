import 'package:flutter/material.dart';
import 'package:intro_to_flutter/widgets/CustTextField.dart';
import 'package:intro_to_flutter/widgets/PasswordField.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool obscurePass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  CustTextField(
                      labelText: "Email Address",
                      hintText: "Enter Email Address",
                      controller: emailController,
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordField(
                      obscureText: obscurePass,
                      onTap: handleObscurePass,
                      labelText: "Password",
                      hintText: "Enter Password",
                      controller: passController)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  handleObscurePass() {
    setState(() {
      obscurePass = !obscurePass;
    });
  }
}
