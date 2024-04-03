import 'package:flutter/material.dart';
import 'home.dart';
import 'login_page.dart';

void main() {
  runApp(InOutApp());
}

class InOutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InOut - An NIT-PY initiative',
      theme: ThemeData(
        primaryColor: Colors.green[800], // Dark green color for buttons // Light leaf green background color
      ),
      home: HomePage(),
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}