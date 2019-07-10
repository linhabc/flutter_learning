import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _questionText;
  Question(this._questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _questionText,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      width: double.infinity,
      margin: EdgeInsets.all(10),
    );
  }
}
