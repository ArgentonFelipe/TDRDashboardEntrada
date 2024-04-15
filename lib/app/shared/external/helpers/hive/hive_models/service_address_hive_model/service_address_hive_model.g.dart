// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_address_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceAddressHiveAdapter extends TypeAdapter<ServiceAddressHiveModel> {
  @override
  final int typeId = 3;

  @override
  ServiceAddressHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceAddressHiveModel(
      ipAddress: fields[1] as String,
      port: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ServiceAddressHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.ipAddress)
      ..writeByte(2)
      ..write(obj.port);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceAddressHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
