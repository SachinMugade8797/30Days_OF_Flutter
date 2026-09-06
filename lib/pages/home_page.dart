import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final num day = 2;

  @override
  Widget build(BuildContext context) { //build is fuction/method (parameters:buildcontext)
    return Scaffold(
      appBar: AppBar(title: Text("Catlog App")),
      body: Center(
        child: Text("Welcome to day $day of flutter development"),
        ),
      drawer: Drawer(),
    );
  }
}