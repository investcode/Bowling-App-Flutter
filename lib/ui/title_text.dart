import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String _titleText;

  TitleText(this._titleText);

  @override
  Widget build(BuildContext context){
    return new Text(
      _titleText, 
      style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold));
  }
}