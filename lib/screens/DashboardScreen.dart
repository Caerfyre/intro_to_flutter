import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BiliBili"), elevation: 30.0, actions: [
        //actions widget in appbar
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              //code to execute when this button is pressed
            }),
      ]),
      body: Center(
        child: Text("Say Hi Back Now!"),
      ),
    );
  }
}
