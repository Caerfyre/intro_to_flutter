import 'package:flutter/material.dart';
import 'package:intro_to_flutter/screens/DashboardScreen.dart';
import 'package:intro_to_flutter/screens/SignUpScreen.dart';
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
  final _formKey = GlobalKey<FormState>();
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Intro To Flutter',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 27),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustTextField(
                          labelText: "Email Address",
                          hintText: "Enter Email Address",
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          errorText: "Email Address is required"),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordField(
                          obscureText: obscurePass,
                          onTap: handleObscurePass,
                          labelText: "Password",
                          hintText: "Enter Password",
                          controller: passController,
                          errorText: "Password is required"),
                      const SizedBox(
                        height: 20,
                      ),
                      CustButton(
                        labelText: "Login",
                        iconData: Icons.login,
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            final emailValue = emailController.text;
                            Navigator.pushReplacementNamed(
                                context, DashboardScreen.routeName,
                                arguments: emailValue);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignUpScreen.routeName);
                        },
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
      ),
    );
  }

  handleObscurePass() {
    setState(() {
      obscurePass = !obscurePass;
    });
  }
}
