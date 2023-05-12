import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sacrosys/model/addCustomer.dart';
import 'package:sacrosys/screen/login.dart';

import 'db/db functions/addCoustomer.dart';
import 'model/TimeModel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CustomerModelAdapter().typeId)) {
    Hive.registerAdapter(CustomerModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TimeModelAdapter().typeId)) {
    Hive.registerAdapter(TimeModelAdapter());
  }
  await refreshTras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Sacrosys',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginUI());
  }
}
