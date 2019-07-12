import '../model/model.dart';

class AddItemAction {
  static int _id;
  final String item;

  AddItemAction(this.item) {
    _id++;
  }

  int get id => _id;
}

class RemoveItemAction {
  final Item item;
  RemoveItemAction(this.item);
}

class RemoveItemsAction {}
