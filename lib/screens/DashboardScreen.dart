import 'package:flutter/material.dart';
import 'package:intro_to_flutter/screens/SettingsScreen.dart';

class DashboardScreen extends StatefulWidget {
  static String routeName = "/dashboard";
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final emailArg = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar:
          AppBar(title: Text("Intro to Flutter"), elevation: 30.0, actions: [
        //actions widget in appbar
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, SettingsScreen.routeName);
            }),
      ]),
      body: Center(
        child: Text("Welcome $emailArg !"),
      ),
    );
  }
}
