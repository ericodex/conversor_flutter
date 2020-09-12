// EricÓdigos - 10 - setembro - 2020

//Glossário de tradução:
//
// Estado = State

import 'dart:ui';
import 'util/conver_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Conversor de Medidas',
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ----------------- (MEMBROS DA CLASSE)
  double _valorDe = 0;
  String _medidaInicial;
  String _medidaConvertida;
  double _resultado = 0;
  String _msgResultado = '';

  @override
  Widget build(BuildContext context) {
    double sizeX = MediaQuery.of(context).size.width;
    double sizeY = MediaQuery.of(context).size.height;

    final TextStyle inputStyle =
        TextStyle(fontSize: 20, color: Colors.green[50]);
    final TextStyle labelStyle =
        TextStyle(fontSize: 24, color: Colors.green[700]);

    final spacer = Padding(padding: EdgeInsets.only(bottom: sizeY / 40));

    final List<String> _measures = [
      'Metros',
      'Quilometros',
      'Gramas',
      'Quilograms',
      'Pés',
      'Milhas',
      'Libras (lbs)',
      'Onças',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de medidas'),
      ),
      body: Container(
        width: sizeX,
        padding: EdgeInsets.all(sizeX / 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Valor',
                style: labelStyle,
              ),
              TextField(
                style: inputStyle,
                decoration: InputDecoration(
                  hintText: 'Insira o número a ser convertido',
                ),
                onChanged: (text) {
                  setState(() {
                    _valorDe = double.parse(text);
                  });
                },
              ),
              spacer,
              Text(
                'de',
                style: labelStyle,
              ),
              spacer,
              DropdownButton(
                isExpanded: true,
                style: inputStyle,
                value: _medidaInicial,
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: inputStyle,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  onStartMeasureChaged(value);
                },
              ),
              spacer,
              Text(
                'Para',
                style: labelStyle,
              ),
              spacer,
              DropdownButton(
                isExpanded: true,
                style: inputStyle,
                value: _medidaConvertida,
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: inputStyle,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  onConvertMeasureChanged(value);
                },
              ),
              spacer,
              RaisedButton(
                child: Text(
                  'Convertido',
                  style: inputStyle,
                ),
                // Ao apertar o botão de conversão
                onPressed: () => convert(),
              ),
              spacer,
              Text(
                _msgResultado,
                style: labelStyle,
              ),
              spacer,
            ],
          ),
        ),
      ),
    );
  }

  void onStartMeasureChaged(value) {
    setState(() {
      _medidaInicial = value;
    });
  }

  void onConvertMeasureChanged(value) {
    setState(() {
      _medidaConvertida = value;
    });
  }

  void convert() {
    if (_medidaInicial.isEmpty || _medidaConvertida.isEmpty || _valorDe == 0) {
      return;
    }
    Conversion c = Conversion();
    double result = c.convert(_valorDe, _medidaInicial, _medidaConvertida);
    setState(() {
      _resultado = result;
      if (result == 0) {
        _msgResultado = 'Essa conversão é um padadoxo!';
      } else {
        _msgResultado =
            '${_valorDe.toString()} $_medidaInicial são ${_resultado.toString()} $_medidaConvertida';
      }
    });
  }
}
