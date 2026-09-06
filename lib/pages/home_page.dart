import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App"),
        backgroundColor: Colors.blue,
        leading: Icon(Icons.menu),
        centerTitle: true,
        actions: [
          Icon(Icons.search),
          Icon(Icons.notifications)
        ],
      ),
    );
  }
}