import 'package:flutter/material.dart';
import './question.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<App> {
  final _questions = [
    'What is your favorite color?',
    'What is your favorite animal?',
    'What is your favorite candy?',
    'What is your favorite chef?',
  ];
  var _index = 0;

  void answerQuestion() {
    print(_index);
    setState(() {
      _index = ++_index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        body: Column(
          children: [
            Question(_questions[_index]),
            RaisedButton(
              child: Text('A'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('B'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('C'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('D'),
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
