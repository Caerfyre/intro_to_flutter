import 'package:flutter/material.dart';
import 'package:intro_to_flutter/screens/DashboardScreen.dart';
import 'package:intro_to_flutter/screens/SignUpScreen.dart';
import 'package:intro_to_flutter/services/AuthService.dart';
import 'package:intro_to_flutter/widgets/CustTextField.dart';
import 'package:intro_to_flutter/widgets/PasswordField.dart';
import 'package:intro_to_flutter/widgets/CustButton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscurePass = true;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
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
                        onPress: () async {
                          if (_formKey.currentState!.validate()) {
                            // final emailValue = emailController.text;
                            // Navigator.pushReplacementNamed(
                            //     context, DashboardScreen.routeName,
                            //     arguments: emailValue);
                            try {
                              setState(() {
                                showSpinner = true;
                              });
                              var User =
                                  await _authService.signInWithEmailandPass(
                                      email: emailController.text,
                                      password: passController.text);
                              if (User != null) {
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacementNamed(
                                    context, DashboardScreen.routeName,
                                    arguments: User.user!.email);
                              }
                            } catch (e) {
                              print(e.toString());
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        height: 25,
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
                            color: Color.fromARGB(255, 28, 115, 185),
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                          child: GestureDetector(
                        onTap: () async {
                          // loginWithGoogle();
                          try {
                            setState(() {
                              showSpinner = true;
                            });
                            var User = await _authService.signInWithGoogle();
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(
                                context, DashboardScreen.routeName,
                                arguments: User.user!.email);
                          } catch (e) {
                            print(e.toString());
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        },
                        child: const Text(
                          "Sign in with Google",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 185, 59, 28),
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

  loginWithGoogle() async {
    try {
      setState(() {
        showSpinner = true;
      });
      var user = await _authService.signInWithGoogle();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      showSpinner = false;
    });
  }
}
