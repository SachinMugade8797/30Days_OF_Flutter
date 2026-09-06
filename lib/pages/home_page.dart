import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
        backgroundColor: Colors.blue,
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.search), Icon(Icons.notifications)],
        elevation: 5,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Text("Bottom content"),
        ),
      ),
    );
  }
}
