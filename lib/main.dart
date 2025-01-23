import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Конвертер валют")),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  String convertedValue = "Финальное число";
  String inputDropdownValue = 'Рубли';
  String outputDropdownValue = 'Рубли';

  static const List<String> dropdownItems = [
    'Рубли',
    'Доллары',
    'Евро',
  ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    double? loadedValue = prefs.getDouble('textFieldValue');
    if (loadedValue != null) {
      setState(() {
        _controller.text = loadedValue.toString();
        convert(inputDropdownValue, outputDropdownValue, loadedValue);
      });
    }
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('textFieldValue', double.tryParse(_controller.text) ?? 0);
  }

  /// Функция для конвертации валют
  void convert(String from, String to, double inputValue) {
    double result = inputValue;

    if (from == 'Доллары') {
      switch (to) {
        case 'Рубли':
          result = inputValue * 75;
          break;
        case 'Евро':
          result = inputValue * 0.83;
          break;
      }
    } else if (from == 'Евро') {
      switch (to) {
        case 'Рубли':
          result = inputValue * 90;
          break;
        case 'Доллары':
          result = inputValue * 1.2;
          break;
      }
    } else if (from == 'Рубли') {
      switch (to) {
        case 'Доллары':
          result = inputValue / 75;
          break;
        case 'Евро':
          result = inputValue / 90;
          break;
      }
    }

    setState(() {
      convertedValue = result.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 380,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Введите число'),
                    keyboardType: TextInputType.number,
                    onChanged: (newValue) {
                      double? inputValue = double.tryParse(newValue);
                      if (inputValue != null) {
                        convert(inputDropdownValue, outputDropdownValue, inputValue);
                        _saveData();
                      } else {
                        setState(() {
                          convertedValue = "Введите корректное число";
                        });
                      }
                    },
                  ),
                ),
                DropdownButton<String>(
                  value: inputDropdownValue,
                  items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (selectedPosition) {
                    setState(() {
                      inputDropdownValue = selectedPosition!;
                      double? inputValue = double.tryParse(_controller.text);
                      if (inputValue != null) {
                        convert(inputDropdownValue, outputDropdownValue, inputValue);
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(convertedValue),
                ),
                DropdownButton<String>(
                  value: outputDropdownValue,
                  items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (selectedPosition) {
                    setState(() {
                      outputDropdownValue = selectedPosition!;
                      double? inputValue = double.tryParse(_controller.text);
                      if (inputValue != null) {
                        convert(inputDropdownValue, outputDropdownValue, inputValue);
                      }
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
