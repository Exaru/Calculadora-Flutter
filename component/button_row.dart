import 'package:flutter/material.dart';
import 'button.dart';

class ButtonRow extends StatelessWidht{
  final List <Button> buttons;

  ButtonRow(
     this.button,
  )
  @override
  Widget build(BuildContext context){
    return Expanded(
      flex 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children buttons,
      
        ), // Row
      );  // Expanded
    }
  }
