import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Display extends StatelessWidget{

  final String text;

  Display(this.text);

  @override
  Widget build(BuildContext context){
    return Expanded(
      flex: 1,
      child: Container(
        color: Color.fromRGBO(69, 69, 69, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              text,
              minFontSize: 20,
              maxFontSize: 80,
              maxLines: 1,
              textAling: textAling.end,
              style: TextStyle(
                fontWeight: FontWeight.w100,
                decoration: TextDecoration.none,
                fontSize: 80,
                color: Colors.white,
              )
            ),
          ),// Padding
        ], // <Widget>[]
       ), // Column
      ), // Container
    );  // Expanded
  }
}