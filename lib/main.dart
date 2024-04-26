import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In-App Purchase App',
      theme: ThemeData(
        // Define the default brightness and colors.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(products: products),
    );
  }
}
