import 'package:flutter/material.dart';
import 'package:intro_to_flutter/screens/LoginScreen.dart';
import 'package:intro_to_flutter/screens/SignUpScreen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
};
