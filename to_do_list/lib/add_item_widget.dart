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
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Add an item'),
        onSubmitted: (String str) {
          widget.model.onAddItem(str);
          controller.text = '';
        },
      ),
    );
  }
}
