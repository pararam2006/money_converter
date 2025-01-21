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
  String dropdownValue = 'Рубли';
  static const List<String> dropdownItems = [
    'Рубли',
    'Доллары',
    'Письки бобра'
  ];

  dynamic convert(from, to, fromValue, toValue) {
    if(from == 'usd') {
     switch (to) {
       case 'rub': {
        //todo: из доллара в рубли
       }
       case 'eur': {
         //todo: из доллара в евро
       }
       case 'usd': {
         //todo: из доллара в доллары (вернуть изначальное значение)
       }
     }
    } else if (from == 'eur') {
      switch (to) {
        case 'rub': {
          //todo: из евро в рубли
        }
        case 'eur': {
          //todo: из евро в евро (вернуть изначальное значение)
        }
        case 'usd': {
          //todo: из евро в доллары
        }
      }
    } else if (from == 'rub') {
      switch (to) {
        case 'rub': {
          //todo: из рублей в рубли (вернуть изначальное значение)
        }
        case 'eur': {
          //todo: из рублей в евро
        }
        case 'usd': {
          //todo: из рублей в доллары
        }
      }
    }
  }
  double firstValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Сумма'),
                  ),
                ),
                DropdownButton<String>(
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
                  },
                ),
              ],
            ),
            
            SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: Text(''),
                ),
                DropdownButton<String>(
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

