import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    num days = 6;
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App", style: TextStyle(color: Colors.white)),
        // backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0.0,
        // actions: [Icon(Icons.search), Icon(Icons.notifications)],
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of flutter learning"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
