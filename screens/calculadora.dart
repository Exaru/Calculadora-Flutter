import 'package:flutter/material.dart';
import '../components/display.dart';
import '../components/keyboard.dart';


class calculadora extends StatefulWidget{

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora>{
  final Memoria memoria = Memoria();

  _onPressed(String command){
    setState((){
      memoria.applyCommand(command);
    }
})

    @override
    Widget build(BuildContext context){
        return MaterialApp(
         home: Column(
             children: <Widget>[
                 Display(memoria.value),
                 Keyboard(_onPressed),
          ], //<Widget>
         ), // Column
        ); //MaterialApp
    }
}