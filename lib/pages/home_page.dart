import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/models/catalog.dart';
import 'package:my_first_app/widgets/drawer.dart';
import 'package:my_first_app/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );
    final decodedData = jsonDecode(catalogJson) as Map<String, dynamic>;
    final products = decodedData["products"] as List<dynamic>;
    CatalogModel.items = products
        .map((e) => Item.fromMap(e as Map<String, dynamic>))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App", style: TextStyle(color: Colors.black)),
        // backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0.0,
        // actions: [Icon(Icons.search), Icon(Icons.notifications)],
      ),
body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CatalogModel.items.isNotEmpty
            ? ListView.builder(
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) =>
                    ItemWidget(item: CatalogModel.items[index]),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
