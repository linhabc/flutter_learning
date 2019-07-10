import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<App> {
  final _questions = [
    {
      'questionText': 'What is your favorite color?',
      'answer': ['Blue', 'Red', 'Green']
    },
    {
      'questionText': 'What is your favorite dish?',
      'answer': ['Fish', 'Pork', 'Sth else']
    },
    {
      'questionText': 'What is your favorite season?',
      'answer': ['Winter', 'Summer', 'Spring']
    },
    {
      'questionText': 'What is your favorite language?',
      'answer': ['Vietnamese', 'English', 'Sth else']
    },
  ];
  var _index = 0;

  void _answerQuestion() {
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
            Question(_questions[_index]['questionText']),
            ...(_questions[_index]['answer'] as List<String>).map((answer) {
              return Answer(answer, _answerQuestion);
            }).toList()
          ],
        ),
      ),
    );
  }
}
