import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Конвертер валют")),
        body: MyApp(),
      ),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key})

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double firstValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        child: DropdownButton(
            items: [

            ],
            onChanged: (selectedPosition) {

            }),
      )
    );
  }
}