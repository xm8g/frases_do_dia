import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(FrasesDia());
}

class FrasesDia extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Frases do Dia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _frases = ["Bom dia","Boa tarde", "Boa noite",
      "Boa Viagem", "Bom almoço", "Bom fds", "Boa sorte"];

  String _fraseGerada = '';

  void _gerarFrase() {
    setState(() {
      int indice = Random().nextInt(_frases.length);
      _fraseGerada = _frases.elementAt(indice);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Text("Clique abaixo para gerar uma frase!",
                style: TextStyle(
                    fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black
                )
              ),
              RaisedButton(
                child: Text(
                    "Nova Frase",
                    style: TextStyle(fontSize: 24, color: Colors.white)
                ),
                color: Colors.green,
                onPressed: () {
                  _gerarFrase();
                },
              ),
              Text(_fraseGerada)
            ],
          ),
        ),
      ),
    );
  }
}
