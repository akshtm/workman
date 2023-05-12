import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sacrosys/model/addCustomer.dart';

const TRANSACTION_DB_NAME = 'transaction-db';
ValueNotifier<List<CustomerModel>> CustomerListNotifier = ValueNotifier([]);

Future<void> addTransaction(CustomerModel obj) async {
  final _db = await Hive.openBox<CustomerModel>(TRANSACTION_DB_NAME);

  _db.put(obj.id, obj);
}

Future<void> refreshTras() async {
  log('inside the refresh function');
  final _list = await getAllData();

  CustomerListNotifier.value.clear();
  CustomerListNotifier.value.addAll(_list);
  log(_list.length.toString());
  log(CustomerListNotifier.value.length.toString());

  // transactionListNotifier.value.forEach((element) { })
  CustomerListNotifier.notifyListeners();

  // await toPie();
  //  await GetPielistIncome();
}

Future<List<CustomerModel>> getAllData() async {
  final _db = await Hive.openBox<CustomerModel>(TRANSACTION_DB_NAME);
  return _db.values.toList();
}
