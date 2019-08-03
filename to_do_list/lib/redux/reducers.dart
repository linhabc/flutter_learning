import 'package:redux/redux.dart';

import './actions.dart';
import '../model/model.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(items: itemReducer(state.items, action));
}

final Reducer<List<Item>> itemReducer = combineReducers([
  TypedReducer<List<Item>, AddItemAction>(addItem),
  TypedReducer<List<Item>, RemoveItemAction>(removeItem),
  TypedReducer<List<Item>, RemoveItemsAction>(removeItems),
  TypedReducer<List<Item>, LoadedItemsAction>(loadedItems),
]);

List<Item> addItem(List<Item> state, AddItemAction action) {
  return List.from(state)..add(Item(id: action.id, body: action.item));
}

List<Item> removeItem(List<Item> state, RemoveItemAction action) {
  return List.unmodifiable(List.from(state)..remove(action.item));
}

List<Item> removeItems(List<Item> state, RemoveItemsAction action) {
  return List.unmodifiable([]);
}

List<Item> loadedItems(List<Item> state, LoadedItemsAction action) {
  return action.items;
}

// This equivalant to above itemReducer
// List<Item> itemReducer(List<Item> state, action) {
//   if (action is AddItemAction) {
//     return List.from(state)..add(Item(id: action.id, body: action.item));
//   }

//   if (action is RemoveItemAction) {
//     return List.unmodifiable(List.from(state)..remove(action.item));
//   }

//   if (action is RemoveItemsAction) {
//     return List.unmodifiable([]);
//   }

//   return state;
// }
