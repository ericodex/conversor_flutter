import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _n;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de medidas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Conversor de medidas'),
        ),
        body: Center(
          child: TextField(
            onChanged: (text) {
              var rv = double.tryParse(text);
              if (rv != null) {
                setState(() {
                  _n = rv;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
