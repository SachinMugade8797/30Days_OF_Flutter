import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Sachin";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catlog App"), backgroundColor: Colors.blue),
      body: Center(child: Text("welcome to $days of flutter $name")),
      drawer: Drawer(),
    );
  }
}