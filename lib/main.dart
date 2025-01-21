
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
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String dropdownValue = 'Рубли';
  static const List<String> dropdownItems = [
    'Рубли',
    'Доллары',
    'Письки бобра'
  ];
  double firstValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Expanded(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  TextField(),
                  DropdownButton(
                    value: dropdownValue,
                    items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (selectedPosition) {
                      setState(() {
                        dropdownValue = selectedPosition!;
                      });
                    }
                  ),
                ],
              ),
              Row(
                children: [
                  TextField(),
                  DropdownButton(
                    value: dropdownValue,
                    items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (selectedPosition) {
                      setState(() {
                        dropdownValue = selectedPosition!;
                      });
                    }
                  ),
                ],
              )
            ]

          ),
        ),
      )
    );
  }
}