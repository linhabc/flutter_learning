import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String _answer;
  final Function _handleTouch;

  Answer(this._answer, this._handleTouch);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(_answer),
        onPressed: _handleTouch,
      ),
    );
  }
}
