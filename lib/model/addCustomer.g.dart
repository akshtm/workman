// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addCustomer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerModelAdapter extends TypeAdapter<CustomerModel> {
  @override
  final int typeId = 1;

  @override
  CustomerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerModel(
      name: fields[1] as String,
      isDeleted: fields[2] as bool,
      location: fields[3] as String,
      Country: fields[4] as String,
      Phone: fields[5] as String,
      Mail: fields[6] as String,
      Cordinatess: fields[7] as String,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, CustomerModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isDeleted)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.Country)
      ..writeByte(5)
      ..write(obj.Phone)
      ..writeByte(6)
      ..write(obj.Mail)
      ..writeByte(7)
      ..write(obj.Cordinatess);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
