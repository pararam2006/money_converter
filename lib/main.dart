import 'package:flutter/material.dart';

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
  double inputTextFieldValue = 0.0;
  String inputDropdownValue = 'Рубли';
  String outputDropdownValue = 'Рубли';
  String convertedValue = "Финальное число";
  static const List<String> dropdownItems = [
    'Рубли',
    'Доллары',
    'Евро',
  ];

  /*
    •	USD → RUB: 75.0
    •	EUR → RUB: 90.0
    •	EUR → USD: 1.2
    •	USD → EUR: 0.83
  */

  dynamic convert(from, to, inputValue) {
    if(from == 'Доллары') {
     switch (to) {
       case 'Рубли': {
         setState(() {
           convertedValue = (inputValue * 75).toString();
         });
       }
       case 'Евро': {
         setState(() {
           convertedValue = (inputValue * 0.83).toString();
         });
       }
       case 'Доллары': {
         setState(() {
           convertedValue = inputValue.toString();
         });
       }
     }
    } else if (from == 'Евро') {
      switch (to) {
        case 'Рубли': {
          setState(() {
            convertedValue = (inputValue * 90).toString();
          });
        }
        case 'Евро': {
          setState(() {
            convertedValue = inputValue.toString();
          });
        }
        case 'Доллары': {
          setState(() {
            convertedValue = (inputValue * 1.2).toString();
          });
        }
      }
    } else if (from == 'Рубли') {
      switch (to) {
        case 'Рубли': {
          setState(() {
            convertedValue = inputValue.toString();
          });
        }
        case 'Евро': {
          setState(() {
            convertedValue = (inputValue / 90).toString();
          });
        }
        case 'Доллары': {
          setState(() {
            convertedValue = (inputValue / 75).toString();
          });
        }
      }
    }
  }
  double firstValue = 0.0;

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
                    decoration: InputDecoration(labelText: 'Введите число'),
                    keyboardType: TextInputType.number,
                    onChanged: (newValue){
                      setState(() {
                        inputTextFieldValue = double.tryParse(newValue)!;
                        convert(inputDropdownValue, outputDropdownValue, inputTextFieldValue);
                      });
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
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  // child: Text("$inputDropdownValue - $outputDropdownValue"),
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

/*
todo: Дополнительное задание (по желанию):
todo: 1.	Добавить поддержку 3+ валют (например, GBP, JPY).
todo: 2.	Сделать расчёт динамическим, используя открытое API для курса валют (например, ExchangeRate API).
todo: 3.	Сохранить последнюю введённую сумму и выбранные валюты с помощью shared_preferences.
*/