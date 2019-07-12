import 'package:flutter/material.dart';
import './main.dart';

class AddItemWidget extends StatefulWidget {
  final ViewModel model;

  AddItemWidget(this.model);

  @override
  _AddItemWidgetState createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: 'Add an item'),
                onSubmitted: (String str) {
                  widget.model.onAddItem(str);
                  controller.text = '';
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  widget.model.onAddItem(controller.text);
                  controller.text = '';
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
