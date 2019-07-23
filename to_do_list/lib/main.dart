import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import './model/model.dart';
import './redux/actions.dart';
import './redux/reducers.dart';

import './add_item_widget.dart';
import './item_list_widget.dart';
import './remove_item_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store =
        Store<AppState>(appStateReducer, initialState: AppState.initialState());

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'To do list',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To do list'),
      ),
      body: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) => Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.delete),
            onPressed: () {
              viewModel.onRemoveItems();
              final snackBar =
                  SnackBar(content: Text('Remove all to do items'));
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
          body: Column(
            children: <Widget>[
              AddItemWidget(viewModel),
              Expanded(child: ItemListWidget(viewModel)),
              // RemoveItemWidget(viewModel),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewModel {
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  ViewModel({
    this.items,
    this.onAddItem,
    this.onRemoveItem,
    this.onRemoveItems,
  });

  factory ViewModel.create(Store<AppState> store) {
    _onAddItem(String body) {
      store.dispatch(AddItemAction(body));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    return ViewModel(
        items: store.state.items,
        onAddItem: _onAddItem,
        onRemoveItem: _onRemoveItem,
        onRemoveItems: _onRemoveItems);
  }
}
