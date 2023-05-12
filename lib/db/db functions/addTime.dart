import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sacrosys/model/TimeModel.dart';

const Time_DB_NAME = 'Time-db';
ValueNotifier<List<TimeModel>> TimeListNotifier = ValueNotifier([]);

Future<void> addTime(TimeModel obj) async {
  final _db = await Hive.openBox<TimeModel>(Time_DB_NAME);

  _db.put(obj.id, obj);
}

Future<void> refreshTimedata(String id) async {
  log('inside the refresh function');
  final _list = await getAllTimeData();
  final a = _list.where((element) {
    return element.CoustomerID == id;
  });
  log(a.toString());
  TimeListNotifier.value.clear();
  TimeListNotifier.value.addAll(a);

  // for (int i = 0; i <= _list.length; i++) {
  //   if (_list[i].CoustomerID == id) {
  //     TimeListNotifier.value.add(_list[i]);
  //   }
  // }

  // TimeListNotifier.value.addAll(_list);
  log(_list.length.toString());
  log(TimeListNotifier.value.length.toString());

  // transactionListNotifier.value.forEach((element) { })
  TimeListNotifier.notifyListeners();

  // await toPie();
  //  await GetPielistIncome();
}

Future<List<TimeModel>> getAllTimeData() async {
  final _db = await Hive.openBox<TimeModel>(Time_DB_NAME);

  return _db.values.toList();
}
