import 'package:flutter/material.dart';

import './main.dart';
import './model/model.dart';

class ItemListWidget extends StatelessWidget {
  final ViewModel viewModel;

  ItemListWidget(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: viewModel.items.map((Item item) {
        return ListTile(
          title: Text(item.body),
          leading: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => viewModel.onRemoveItem(item),
          ),
        );
      }).toList(),
    );
  }
}
