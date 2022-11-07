import 'package:bs_flutter_buttons/bs_flutter_buttons.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_flutter/widgets/CustTextField.dart';
import 'package:intro_to_flutter/widgets/PasswordField.dart';
import 'package:intro_to_flutter/widgets/CustButton.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool obscurePass = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: screenWidth * .9,
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
                        controller: passController),
                    const SizedBox(
                      height: 20,
                    ),
                    CustButton(
                        labelText: "Login",
                        iconData: Icons.login,
                        onPress: () {}),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ))
                  ],
                ),
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
