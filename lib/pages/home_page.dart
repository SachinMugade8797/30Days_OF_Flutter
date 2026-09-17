import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/models/catalog.dart';
import 'package:my_first_app/widgets/drawer.dart';

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
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: GridTile(
                      header: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.deepPurple,
                        alignment: Alignment.center,
                        child: Text(
                          item.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      footer: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          "\$ ${item.price}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      child: Image.network(item.image, fit: BoxFit.cover),
                    ),
                  );
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
