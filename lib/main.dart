import 'package:flutter/material.dart';
import 'package:intro_to_flutter/routes.dart';
import 'package:intro_to_flutter/screens/LoginScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: LoginScreen.routeName,
    routes: routes,
  ));
}
