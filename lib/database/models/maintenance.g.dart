// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaintenanceAdapter extends TypeAdapter<Maintenance> {
  @override
  final int typeId = 2;

  @override
  Maintenance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Maintenance(
      procedure: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Maintenance obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.procedure);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaintenanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Maintenance _$MaintenanceFromJson(Map<String, dynamic> json) => Maintenance(
      procedure: json['procedure'] as String,
    );

Map<String, dynamic> _$MaintenanceToJson(Maintenance instance) =>
    <String, dynamic>{
      'procedure': instance.procedure,
    };
