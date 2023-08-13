import 'package:flutter/material.dart';
import 'package:fms/pages/Home.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _State();
}

class _State extends State<MyApp>{

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Home(),
  );
}