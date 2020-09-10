// EricÓdigos - 10 - setembro - 2020

//Glossário de tradução:
//
// Estado = State

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _n;

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)'
        'ounces',
  ];

  @override
  void initState() {
    // Determina o estado inicial
    _n = 0;
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de medidas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Conversor de medidas'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                onChanged: (text) {
                  // É ativado sempre que o textFild é alterado.
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      // Altera o estado
                      _n = rv;
                    });
                  }
                },
              ),
              Text((_n == null) ? '' : _n.toString())
            ],
          ),
        ),
      ),
    );
  }
}

//var fruits = ['Orange', 'Aple', 'Strawberry', 'Banana'];

// DropdownButton<String>(
//   items: fruit.map((String value) {
//     return DropdownMenuItem<String>(
//         value: value,
//         child: Text(value),);

//   }).toList(),
//   onChange: (String newValue) {}
// )
