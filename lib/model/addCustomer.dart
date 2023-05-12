import 'package:hive_flutter/adapters.dart';
part 'addCustomer.g.dart';

@HiveType(typeId: 1)
class CustomerModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final bool isDeleted;
  @HiveField(3)
  final String location;
  @HiveField(4)
  final String Country;
  @HiveField(5)
  final String Phone;
  @HiveField(6)
  final String Mail;
  @HiveField(7)
  final String Cordinatess;

  CustomerModel({
    required this.name,
    this.isDeleted = false,
    required this.location,
    required this.Country,
    required this.Phone,
    required this.Mail,
    required this.Cordinatess,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
