import 'package:async/async.dart';
import 'dart:convert';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';
import './actions.dart';

void saveToPrefs(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var itemsState = json.encode(state.toJson());
  await preferences.setString('itemsState', itemsState);
}

Future<AppState> loadFromPrefs() async {}
