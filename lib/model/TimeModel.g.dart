// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TimeModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeModelAdapter extends TypeAdapter<TimeModel> {
  @override
  final int typeId = 2;

  @override
  TimeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeModel(
      Time: fields[1] as String,
      isDeleted: fields[2] as bool,
      CoustomerID: fields[3] as String,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, TimeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.Time)
      ..writeByte(2)
      ..write(obj.isDeleted)
      ..writeByte(3)
      ..write(obj.CoustomerID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
