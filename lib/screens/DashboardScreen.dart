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
      appBar: AppBar(
          title: const Text("Intro to Flutter Dashboard"),
          elevation: 10.0,
          actions: [
            IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.pushNamed(context, SettingsScreen.routeName);
                }),
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              emailArg,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
