import 'package:hive_flutter/hive_flutter.dart';
part 'TimeModel.g.dart';

@HiveType(typeId: 2)
class TimeModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String Time;
  @HiveField(2)
  final bool isDeleted;
  @HiveField(3)
  final String CoustomerID;
  TimeModel({
    required this.Time,
    this.isDeleted = false,
    required this.CoustomerID,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
