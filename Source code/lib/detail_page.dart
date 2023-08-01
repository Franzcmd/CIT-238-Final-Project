import 'package:flutter/material.dart';
import 'homepage.dart';


class DetailPage extends StatelessWidget {
  final Item item;

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${item.id}',
              style: TextStyle(fontSize: 20, color: grassGreen[700]),
            ),
            SizedBox(height: 10),
            Text(
              'Name: ${item.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: grassGreen[900]),
            ),
            SizedBox(height: 10),
            Text(
              'Description: ${item.description}',
              style: TextStyle(fontSize: 18, color: grassGreen[800]),
            ),
            SizedBox(height: 10),
            Text(
              'Weight: ${item.weight}',
              style: TextStyle(fontSize: 18, color: grassGreen[800]),
            ),
            SizedBox(height: 10),
            Text(
              'Height: ${item.height}',
              style: TextStyle(fontSize: 18, color: grassGreen[800]),
            ),
          ],
        ),
      ),
    );
  }
}