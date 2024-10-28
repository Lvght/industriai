// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceOrderAdapter extends TypeAdapter<ServiceOrder> {
  @override
  final int typeId = 0;

  @override
  ServiceOrder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceOrder(
      id: fields[0] as String,
      transcription: fields[1] as String,
      procedures: (fields[2] as List).cast<Order>(),
    );
  }

  @override
  void write(BinaryWriter writer, ServiceOrder obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.transcription)
      ..writeByte(2)
      ..write(obj.procedures);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceOrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceOrder _$ServiceOrderFromJson(Map<String, dynamic> json) => ServiceOrder(
      id: json['id'] as String,
      transcription: json['transcription'] as String,
      procedures: (json['orders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceOrderToJson(ServiceOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transcription': instance.transcription,
      'orders': instance.procedures,
    };
