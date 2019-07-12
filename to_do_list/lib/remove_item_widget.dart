import 'package:flutter/material.dart';

import './main.dart';

class RemoveItemWidget extends StatelessWidget {
  final ViewModel viewModel;

  RemoveItemWidget(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        child: Text('Remove all'),
        onPressed: () => viewModel.onRemoveItems(),
      ),
    );
  }
}
