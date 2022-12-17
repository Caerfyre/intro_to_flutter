import 'package:flutter/material.dart';
import 'package:intro_to_flutter/screens/LoginScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../services/AuthService.dart';
import '../widgets/CustButton.dart';
import '../widgets/CustTextField.dart';
import '../widgets/PasswordField.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/signup";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController cPassController = TextEditingController();
  final _signFormKey = GlobalKey<FormState>();
  bool obscurePass = true;
  bool obscureConPass = true;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: screenWidth * .9,
              child: Form(
                key: _signFormKey,
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
                        'Sign Up',
                        style: TextStyle(fontSize: 27),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustTextField(
                        labelText: "First Name",
                        hintText: "Enter First Name",
                        controller: fNameController,
                        textInputType: TextInputType.name,
                        errorText: "First Name is required"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustTextField(
                        labelText: "Last Name",
                        hintText: "Enter Last Name",
                        controller: lNameController,
                        textInputType: TextInputType.name,
                        errorText: "Last Name is required"),
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
                      onTap: () {
                        setState(() {
                          obscurePass = !obscurePass;
                        });
                      },
                      labelText: "Password",
                      hintText: "Enter Password",
                      controller: passController,
                      errorText: "Password is required",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordField(
                      obscureText: obscureConPass,
                      onTap: () {
                        setState(() {
                          obscureConPass = !obscureConPass;
                        });
                      },
                      labelText: "Confirm Password",
                      hintText: "Confirm Password",
                      controller: cPassController,
                      errorText: "Confirm Password is required",
                      confirmVal: passController.text,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustButton(
                        labelText: "Sign up",
                        iconData: Icons.login_rounded,
                        onPress: () async {
                          if (_signFormKey.currentState!.validate()) {
                            try {
                              setState(() {
                                showSpinner = true;
                              });

                              var register =
                                  await _authService.registerWithEmailandPass(
                                      email: emailController.text,
                                      password: passController.text);

                              if (register != null) {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  duration: const Duration(seconds: 3),
                                  content: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(16),
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 22, 154, 47),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: const Text(
                                        'Successfully Registered!',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  backgroundColor:
                                      // ignore: use_build_context_synchronously
                                      Theme.of(context).scaffoldBackgroundColor,
                                ));

                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.routeName);
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  duration: const Duration(seconds: 3),
                                  content: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(16),
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: const Text(
                                        'Something went wrong! Please try again.',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  backgroundColor:
                                      // ignore: use_build_context_synchronously
                                      Theme.of(context).scaffoldBackgroundColor,
                                ));
                              }
                            } catch (e) {
                              print(e);
                            }

                            setState(() {
                              showSpinner = false;
                            });
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    CustButton(
                        labelText: "Login",
                        iconData: Icons.login,
                        onPress: () {
                          if (_signFormKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.routeName);
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
