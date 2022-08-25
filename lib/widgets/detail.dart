import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final item;

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail"),),
      body: Column(
        children: [
          Text(item["name"]),
          Text(item["description"]),
          Text(item["place"])
        ],
      ),
    );
  }
}
