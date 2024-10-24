import 'package:flutter/material.dart';
import 'package:midterm_project/screens/listscreen.dart';

void main() {
  runApp(ListApp());
}

class ListApp extends StatelessWidget {
  const ListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyList(),
    );
  }
}
