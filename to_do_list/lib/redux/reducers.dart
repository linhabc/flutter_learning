import './actions.dart';
import '../model/model.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(items: itemReducer(state.items, action));
}

List<Item> itemReducer(List<Item> state, action) {
  if (action is AddItemAction) {
    print('object');
    return []
      ..addAll(state)
      ..add(Item(id: action.id, body: action.item));
  }

  if (action is RemoveItemAction) {
    return List.unmodifiable(List.from(state))..remove(action.item);
  }

  if (action is RemoveItemsAction) {
    return List.unmodifiable([]);
  }

  return state;
}

// switch (action) {
//   case AddItemAction:
//     return []
//       ..addAll(state)
//       ..add(Item(id: action.id, body: action.item));
//     break;

//   case RemoveItemAction:
//     return List.unmodifiable(List.from(state))..remove(action.item);
//     break;

//   case RemoveItemsAction:
//     return List.unmodifiable([]);
//     break;
//   default:
//     return state;
// }
