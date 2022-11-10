import 'package:flutter/material.dart';
import 'package:intro_to_flutter/screens/DashboardScreen.dart';
import 'package:intro_to_flutter/screens/LoginScreen.dart';
import 'package:intro_to_flutter/screens/SignUpScreen.dart';
import 'package:intro_to_flutter/screens/SettingsScreen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  DashboardScreen.routeName: (context) => const DashboardScreen(),
  SettingsScreen.routeName: (context) => const SettingsScreen(),
};
