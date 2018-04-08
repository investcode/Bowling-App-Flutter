import 'package:flutter/material.dart';

class SubitleText extends StatelessWidget {
  final String _subtitleText;

  SubitleText(this._subtitleText);

  @override
  Widget build(BuildContext context){
    return new Text(
      _subtitleText, 
      style: new TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold));
  }
}